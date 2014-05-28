require 'spec_helper'

describe RiotAPI::Requester do
  
  let(:request_url)   { "https://prod.api.pvp.net/api/lol/na/v1.4/summoner/by-name/tiqoo" }
  let(:mock_strategy) { OpenStruct.new summoner: request_url }
  let(:requester)     { mock_strategy.extend(RiotAPI::Requester) }
  let(:conn)          { requester.conn }
  let(:file)          { File.read File.join(File.expand_path(File.dirname(__FILE__)), "./fixtures/summoner.json") }
  let(:response)      { OpenStruct.new body: JSON.parse(file) }
  
  before do
    RiotAPI::API.stub(:key) { "abc" }
  end
  
  describe "#find" do
    
    it "calls only when find is present" do
      url = "#{request_url}?api_key=abc"
      expect(conn).to receive(:get).with(url).and_return(response)
      requester.find_summoner
    end
    
    it 'returns error if strategy do not respond to the action' do
      expect{ requester.find_unkown }.to raise_error
    end
    
  end
  
end