require 'spec_helper'

describe RiotAPI::Strategies::Champion do
  
  let(:strategy) { RiotAPI::Strategies::Champion.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v1.2/champion")
  end
  
  it "returns all champions url" do
    strategy.all.should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.2/champion")
  end
  
  it "returns by champion id url" do
    strategy.by_id("c1").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.2/champion/c1")
  end
  
end