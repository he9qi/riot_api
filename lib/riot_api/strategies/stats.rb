# stats-v2.3

module RiotAPI
  module Strategies
    
    class Stats < Default
      
      def initialize(params={})
        options = {
          version: "v1.3",
          type: "stats"
        }.merge(params)
        super options
      end
      
      def ranked_by_summoner_id(id)
        request_url + "/by-summoner/" + id + "/ranked"
      end
      
      def summary_by_summoner_id(id)
        request_url + "/by-summoner/" + id + "/summary"
      end
      
    end
  end
end