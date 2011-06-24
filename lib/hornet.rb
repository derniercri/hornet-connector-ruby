require "redis"
require "alphadecimal"
require "json"

module Hornet
  EVENTS = [
    "hornet:events:connect",
    "hornet:events:disconnect"
  ]
  
  def token_TTL( token_TTL )
    @token_TTL ||= token_TTL
    
    @token_TTL || 120
  end

  def redis_options(redis_option={})
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
  def create_access_token(channel)
    token_id = redis.incr "hornet:tokens_id"

    token = (token_id.to_s + generate_token_suffix).to_i.alphadecimal
    
    key = "hornet:token:" + token

    redis.set key, channel
    redis.expire key, token_TTL

    return token;
  end

  def disconnect_tokens(tokens)
    disconnectMsg = "token:" + tokens.to_json

    publish("hornet", "disconnect_tokens", disconnectMsg)
  end
  

  def publish(channel, type, message, options)
    redis.publish("hornet:channel:" + channel.to_s, message.merge(:type => type).merge(options).to_json)
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