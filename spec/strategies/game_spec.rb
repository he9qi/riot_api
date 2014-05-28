require 'spec_helper'

describe Riot::Strategies::Game do
  
  let(:strategy) { Riot::Strategies::Game.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/na/v1.3/game")
  end
  
  it "returns recent games by summoner url" do
    strategy.recent_by_summoner_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/na/v1.3/game/by-summoner/1/recent")
  end
  
end