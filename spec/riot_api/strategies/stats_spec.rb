require 'spec_helper'

describe RiotAPI::Strategies::Stats do
  
  let(:strategy) { RiotAPI::Strategies::Stats.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v1.3/stats")
  end
  
  it "returns ranked by-summoner url" do
    strategy.ranked_by_summoner_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/1/ranked")
  end
  
  it "returns summary by-summoner url" do
    strategy.summary_by_summoner_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/1/summary")
  end
  
end