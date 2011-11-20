require "redis"
require "alphadecimal"
require "json"

module Hornet
  EVENTS = [
    "hornet:events:connect",
    "hornet:events:disconnect"
  ]
  
  def token_TTL( token_TTL = nil )
    @token_TTL ||= token_TTL
    
    @token_TTL || 120
  end

  def redis_options( redis_option = {} )
    @redis_options ||= redis_option
  end
  
  # tokens are the base62 version of the concatenation (string) of :
  # - unique id on any number of digits
  #
  # - current timestamp (in seconds) left padded to be on 10 digits. 
  #   i.e. it means any timestamp will look like : 0001234953. 
  #   10 digits are enough to go to Sat Nov 20 18:46:39 +0100 2286 (9999999999)
  #
  # - a random number on 5 digits, again, left padded with 0.
  #   This last part is just to increase the complexity of the token.
  def create_access_token( *args )
    token_id = redis.incr "hornet:tokens_id"

    token = (token_id.to_s + generate_token_suffix).to_i.alphadecimal
    
    key = "hornet:token:" + token
    if args[0].is_a? Hash
      opts = args[0]

      if opts[:channels]

        opts[:channels].each do |channel|
          redis.sadd key, channel
        end

      elsif opts[:channel]
        redis.sadd key, opts[:channel] 
      end

    else
      puts '*** DEPRECATED : Please use :channel => "#{args[0]}" instead of "#{args[0]}" ***'
      redis.sadd key, args[0]
    end

    redis.expire key, token_TTL

    return token
  end


  def disconnect_tokens(tokens)
    disconnectMsg = "token:" + tokens.to_json

    publish("hornet", "disconnect_tokens", disconnectMsg)
  end
  

  def publish( *args )
    if args[0].is_a? Hash
      opts = args[0]
      opts[:options] ||= {}

      if opts[:channels]

        opts[:channels].each do |channel|
          redis.publish("hornet:channel:" + channel.to_s, opts[:message].merge( :type => opts[:type], :channel => channel.to_s  ).merge(opts[:options]).to_json )
        end

      elsif opts[:channel]
        redis.publish("hornet:channel:" + opts[:channel].to_s, opts[:message].merge( :type => opts[:type], :channel => opts[:channel].to_s ).merge(opts[:options]).to_json )
      end

    else
      puts '*** DEPRECATED : Please use :type , :channel(s) :message :options instead of direct args ***'
      args[3] ||= {}
      redis.publish("hornet:channel:" + args[0].to_s, args[2].merge( :type => args[1].to_s, :channel => args[0].to_s ).merge( args[3] ).to_json)
    end
  end
  
  
  def subscribe 
    Redis.new(:host => redis_options['redis_host'], :port => redis_options['redis_port']).subscribe(*EVENTS) do |on|
      on.message do |type, msg|
        yield(type.gsub(/^hornet:events:/, "").to_sym, JSON.parse(msg))
      end
    end
  end


  def redis
    @redis ||= Redis.new(redis_options)
  end
  
  protected

    extend self

  private
    
    def generate_token_suffix
      time = Time.now.to_i
      
      ("%010d" % time ) + ("%05d" % rand(100000))
    end
end