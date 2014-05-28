# team-v2.3

module Riot
  module Strategies
    
    class Team < Default
      
      def initialize(params={})
        options = {
          version: "v2.3",
          type: "team"
        }.merge(params)
        super options
      end
      
      def by_summoner_ids(ids)
        request_url + "/by-summoner/" + ids 
      end
      
      def by_ids(ids)
        request_url + "/" + ids
      end
      
    end
  end
end