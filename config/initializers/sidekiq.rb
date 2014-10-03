require 'sidekiq'

redis_conn = proc {
  Redis::Namespace('sidekiq', redis: $redis)
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 25, &redis_conn)
  config.poll_interval = 45
end