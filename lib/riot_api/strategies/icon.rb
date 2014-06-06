# icon-v4.9.1

module RiotAPI
  module Strategies
    
    class Icon < Default
      
      def initialize(params={})
        options = {
          host: "http://ddragon.leagueoflegends.com/cdn/4.9.1/img",
          version: "v4.9.1",
          type: "icon"
        }.merge(params)
        super options
      end
      
      def request_url
        @options[:host] + "/profileicon"
      end
      
      def by_id(id)
        request_url + "/" + id + ".png"
      end
      
    end
  end
end