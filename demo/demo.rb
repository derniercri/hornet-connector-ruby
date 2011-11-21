require "bundler/setup"

require "sinatra"
require "hornet"

redis = Hornet.redis

connected_to_redis = false
begin
  redis.ping
  connected_to_redis = true
rescue Errno::ECONNREFUSED
end


before do
  halt 418, haml(:redis_error) unless connected_to_redis
end

get "/" do
  haml :index
end