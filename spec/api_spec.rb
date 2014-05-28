require 'spec_helper'

describe Riot::API do
  
  before { Riot::API.setup("abc") }
  
  it "returns key" do
    Riot::API.key.should eq("abc")
  end
  
  let(:summoner) { Riot::Strategies::Summoner.new }
  
  describe "#call" do
    
    it "raise strategy not registered error" do
      expect { Riot::API.call("summoner", "find_by_names", "1") }.to \
        raise_error(Riot::API::StrategyNotRegistered)
    end
    
    describe "#registed strategy" do
      
      before do
        Riot::API.register("summoner")
        class MockFaraday; def get(url); OpenStruct.new(body: "foo"); end; end
        Faraday.stub(:new) { MockFaraday.new }
      end
      
      it "calls summoner's method" do
        expect(Riot::API.summoner).to \
          receive(:by_names).with("1").and_return("url")
          
        Riot::API.call("summoner", "find_by_names", "1")
      end
      
      it "uses summoner directly" do
        expect(Riot::API.summoner).to \
          receive(:by_names).with("1").and_return("url")
          
        Riot::API.summoner.find_by_names "1"
      end
      
    end
    
    describe "#register_all" do
      before { Riot::API.register_all }
      
      it "registers all strategies" do
        Riot::API.respond_to?(:team).should be(true)
      end
    end
    
  end
  
end