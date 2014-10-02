dbID = if Rails.env.test? then 15 else 2 end
$redis = Redis.new host: '127.0.0.1', port: 6379, db: dbID