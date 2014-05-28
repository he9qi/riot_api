require 'spec_helper'

describe RiotAPI::Strategies::Default do
  
  let(:strategy) { RiotAPI::Strategies::Default.new(type: "default", version: "0.1") }
  
  it "returns api url" do
    strategy.api_url.should eq("https://prod.api.pvp.net/api/lol/na")
  end
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/0.1/default")
  end
  
  describe "#raise_error" do
  
    it "raise strategy not found if type is not provided" do
      expect { RiotAPI::Strategies::Default.new.request_url }.to \
        raise_error(RiotAPI::Strategies::StrategyNotFound)
    end
  
    it "raise strategy not found if version is not provided" do
      expect { RiotAPI::Strategies::Default.new(type: "default").request_url }.to \
        raise_error(RiotAPI::Strategies::StrategyNotFound)
    end
    
    it "raise error if method is not provided" do
      expect { strategy.send "unkown method" }.to raise_error
    end
    
  end
  
end