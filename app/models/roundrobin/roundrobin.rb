class Roundrobin < ActiveRecord::Base
  require 'yaml'
  attr_accessor @candidates

  def candidates
    return @candidates unless @candidates.nil?
    @candidates = YAML.load_file("lala.yml")
  end

  def next
    
  end
end
