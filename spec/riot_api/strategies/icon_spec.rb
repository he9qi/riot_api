require 'spec_helper'

describe RiotAPI::Strategies::Icon do
  
  let(:icon) { RiotAPI::Strategies::Icon.new }
  
  it "returns request url" do
    icon.request_url.should eq("http://ddragon.leagueoflegends.com/cdn/4.9.1/img/profileicon")
  end
  
  it "returns icon url for the id" do
    icon.by_id("607").should \
      eq("http://ddragon.leagueoflegends.com/cdn/4.9.1/img/profileicon/607.png")
  end
  
end