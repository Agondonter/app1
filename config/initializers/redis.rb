if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end

puts "Caching products count..."

$redis.set("products_count", Product.count)