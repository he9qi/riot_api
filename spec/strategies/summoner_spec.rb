require 'spec_helper'

describe Riot::Strategies::Summoner do
  
  let(:strategy) { Riot::Strategies::Summoner.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner")
  end
  
  it "returns by-name url" do
    strategy.by_names("tiqoo,lanjj").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner/by-name/tiqoo,lanjj")
  end

  it "returns by ids url" do
    strategy.by_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner/1,2")
  end
  
  it "returns by masteries url" do
    strategy.masteries_by_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner/1,2/masteries")
  end

  it "returns by names url" do
    strategy.names_by_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner/1,2/name")
  end
  
  it "returns by runes url" do
    strategy.runes_by_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.4/summoner/1,2/runes")
  end
  
end