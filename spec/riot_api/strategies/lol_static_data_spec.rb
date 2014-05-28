require 'spec_helper'

describe RiotAPI::Strategies::LolStaticData do
  
  let(:strategy) { RiotAPI::Strategies::LolStaticData.new }
  
  it "returns request url" do
    strategy.request_url.should eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2")
  end

  it "returns versions" do
    strategy.versions.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/versions")
  end

  it "returns realm" do
    strategy.realm.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/realm")
  end
  
  it "returns champion list" do
    strategy.champion.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/champion")
  end

  it "returns champion by id" do
    strategy.champion_by_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/champion/1")
  end
  
  it "returns item list" do
    strategy.item.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/item")
  end

  it "returns item by id" do
    strategy.item_by_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/item/1")
  end
  
  it "returns mastery list" do
    strategy.mastery.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/mastery")
  end

  it "returns mastery by id" do
    strategy.mastery_by_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/mastery/1")
  end
  
  it "returns rune list" do
    strategy.rune.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/rune")
  end

  it "returns rune by id" do
    strategy.rune_by_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/rune/1")
  end

  it "returns summoner-spell list" do
    strategy.summoner_spell.should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/summoner-spell")
  end

  it "returns summoner-spell by id" do
    strategy.summoner_spell_by_id("1").should \
      eq("https://prod.api.pvp.net/api/lol/static-data/na/v1.2/summoner-spell/1")
  end
  
end