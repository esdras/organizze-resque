uri = URI.parse(ENV["REDIS_URL"])
REDIS_SERVER = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
REDIS_NAMESPACE = "organizze:pessoal:#{ENV["REDIS_NAMESPACE"]}:production"
REDIS = Redis::Namespace.new(REDIS_NAMESPACE, :redis => REDIS_SERVER)
Resque.redis = REDIS
