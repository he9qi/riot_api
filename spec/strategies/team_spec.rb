require 'spec_helper'

describe Riot::Strategies::Team do
  
  let(:strategy) { Riot::Strategies::Team.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v2.3/team")
  end
  
  it "returns by-summoner url" do
    strategy.by_summoner_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.3/team/by-summoner/1,2")
  end
  
  it "returns by team ids url" do
    strategy.by_ids("team1,team2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.3/team/team1,team2")
  end
  
end