require "roundrobin/version"
require 'digest/sha1'
require 'redis'

class Roundrobin

  def initialize(redis_conn = nil)
    @redis = redis_conn.nil? ? Redis.new : Redis.new(url: redis_conn)
  end

  def next(candidates)
    return nil unless candidates.is_a?(Array) and candidates.length > 0
    identifier = get_hash(candidates)
    iterator = @redis.get(identifier)
    if iterator.nil?
      iterator   = -1 
    else
      iterator = iterator.to_i
    end
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
