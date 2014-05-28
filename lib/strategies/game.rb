# game-v1.3

module Riot
  module Strategies
    
    class Game < Default
      
      def initialize(params={})
        options = {
          version: "v1.3",
          type: "game"
        }.merge(params)
        super options
      end
      
      def recent_by_summoner_id(id)
        request_url + "/by-summoner/" + id + "/recent" 
      end
      
    end
  end
end