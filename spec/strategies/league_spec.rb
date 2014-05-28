require 'spec_helper'

describe Riot::Strategies::League do
  
  let(:strategy) { Riot::Strategies::League.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v2.4/league")
  end
  
  it "returns by summoner ids url" do
    strategy.by_summoner_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.4/league/by-summoner/1,2")
  end
  
  it "returns league entries by summoner ids url" do
    strategy.entries_by_summoner_ids("1,2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.4/league/by-summoner/1,2/entry")
  end

  it "returns by team ids url" do
    strategy.by_team_ids("t1,t2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.4/league/by-team/t1,t2")
  end

  it "returns entries by team ids url" do
    strategy.entries_by_team_ids("t1,t2").should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.4/league/by-team/t1,t2/entry")
  end
  
  it "returns challenger tier leagues" do
    strategy.challenger.should \
      eq("https://prod.api.pvp.net/api/lol/na/v2.4/league/challenger")
  end
  
end