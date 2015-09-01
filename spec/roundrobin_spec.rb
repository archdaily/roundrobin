require 'spec_helper'

RSpec.describe Roundrobin, :type => :model do
  let(:rr) {Roundrobin.new}
  let(:candidates) {['candidate1','candidate2', 'candidate3']}

  describe "next" do
    it "returns nil when the candidates are not a valid array" do
      expect(rr.next('123')).to be_nil
    end

    it "returns the first candidate the first time" do
      expect(rr.next(candidates)).to eq("candidate1")
    end
  
    it "returns the second one after the first one" do
      rr.next(candidates)
      expect(rr.next(candidates)).to eq('candidate2')
    end

    it "returns the first candidate after returning the last one" do
      rr.next(candidates)
      rr.next(candidates)
      rr.next(candidates)
      expect(rr.next(candidates)).to eq('candidate1')
    end

    it "works with hashs" do
      candidates_hash = [{name: 'frank', email: 'frank@example.com'},{name: 'alex', email: 'alex@example.com'}]
      expect(rr.next(candidates_hash)[:name]).to eq('frank')
      expect(rr.next(candidates_hash)[:name]).to eq('alex')
    end

    it 'works with integers' do
      expect(rr.next([1,2,3])).to eq(1)
    end

    it "returns nil for a empty array" do
      expect(rr.next([])).to be_nil
    end
  end
end
