require 'spec_helper'

RSpec.describe Roundrobin, :type => :model do
  describe "next" do
    it "returns nil when the candidates are not a valid array" do
      rr = Roundrobin.new.next('123')
      expect(rr).to be_nil
    end
    
  end
end
