require 'spec_helper'

describe RiotAPI::API do
  
  before { RiotAPI::API.setup("abc") }
  
  it "returns key" do
    RiotAPI::API.key.should eq("abc")
  end
  
  let(:summoner) { RiotAPI::Strategies::Summoner.new }
  
  describe "#call" do
    
    it "raise strategy not registered error" do
      expect { RiotAPI::API.call("summoner", "find_by_names", "1") }.to \
        raise_error(RiotAPI::API::StrategyNotRegistered)
    end
    
    describe "#registed strategy" do
      
      before do
        RiotAPI::API.register("summoner")
        stubs = Faraday::Adapter::Test::Stubs.new do |stub|
          stub.get("/url") { [200, {}, 'foo'] }
        end
        Faraday.stub(:new) { stubs }
      end
      
      it "calls summoner's method" do
        expect(RiotAPI::API.summoner).to \
          receive(:by_names).with("1").and_return("/url")
          
        RiotAPI::API.call("summoner", "find_by_names", "1")
      end
      
      it "uses summoner directly" do
        expect(RiotAPI::API.summoner).to \
          receive(:by_names).with("1").and_return("/url")
          
        RiotAPI::API.summoner.find_by_names "1"
      end
      
    end
    
    describe "#register_all" do
      before { RiotAPI::API.register_all }
      
      it "registers all strategies" do
        RiotAPI::API.respond_to?(:team).should be(true)
      end
    end
    
  end
  
end