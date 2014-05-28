# summoner-v1.4

module Riot
  module Strategies
    
    class Summoner < Default
      
      def initialize(params={})
        options = {
          version: "v1.4",
          type: "summoner"
        }.merge(params)
        super options
      end
      
      # Get summoner objects mapped by standardized summoner name 
      # for a given list of summoner names
      def by_names(names)
        request_url + "/by-name/" + names 
      end
      
      # Get summoner objects mapped by summoner ID for a given 
      # list of summoner IDs
      def by_ids(ids)
        request_url + "/" + ids
      end
      
      # Get mastery pages mapped by summoner ID for a given list 
      # of summoner IDs
      def masteries_by_ids(ids)
        request_url + "/" + ids + "/masteries" 
      end
      
      # Get summoner names mapped by summoner ID for a given list 
      # of summoner IDs
      def names_by_ids(ids)
        request_url + "/" + ids + "/name" 
      end

      # Get rune pages mapped by summoner ID for a given list 
      # of summoner IDs
      def runes_by_ids(ids)
        request_url + "/" + ids + "/runes" 
      end
      
    end
    
  end
end