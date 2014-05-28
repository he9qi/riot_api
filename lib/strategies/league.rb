# league-v2.4

module Riot
  module Strategies
    
    class League < Default
      
      def initialize(params={})
        options = {
          version: "v2.4",
          type: "league"
        }.merge(params)
        super options
      end
      
      def by_summoner_ids(ids)
        request_url + "/by-summoner/" + ids 
      end
      
      def entries_by_summoner_ids(ids)
        request_url + "/by-summoner/" + ids + "/entry"
      end
      
      def by_team_ids(ids)
        request_url + "/by-team/" + ids 
      end
      
      def entries_by_team_ids(ids)
        request_url + "/by-team/" + ids + "/entry"
      end

      def challenger
        request_url + "/challenger"
      end
      
    end
  end
end