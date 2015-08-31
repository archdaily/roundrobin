require "roundrobin/version"

module Roundrobin
  require 'digest/sha1'

  def initializer(redis_connection)
    @redis = Redis.new(:url => redis_connection)
  end

  def next(candidates)
    return nil unless candidates.is_a?(Array)
    identifier = get_hash(candidates)
    iterator = @redis.get(identifier) || 0
    iterator += 1
    iterator = 0 if iterator >= candidates.length
    @redis.set(identifier, iterator)
    candidates[iterator]
  end
  
  private
  def get_hash(candidates)
    Digest::SHA1.hexdigest candidates.to_s
  end
end
