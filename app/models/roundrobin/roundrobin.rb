class Roundrobin < ActiveRecord::Base
  require 'yaml'
  require 'digest/sha1'
  attr_accessor @candidates

  def next
    return nil unless @candidates.is_a?(Array)
    if iterator.nil?
      self.iterator = 0
    else
      self.iterator += 1
      self.iterator = 0 if iterator >= @candidates.length
    end
    self.save
    @candidates[self.iterator]
  end

  def self.next(candidates)
    @candidates = candidates
    identifier = Digest::SHA1.hexdigest candidates.to_s
    find_or_initialize_by(identifier: identifier).next
  end

end
