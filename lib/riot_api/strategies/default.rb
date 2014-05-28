module RiotAPI
  module Strategies
    class StrategyNotFound < StandardError; end
    
    class Default
      
      def initialize(params={})
        @options = {
          host:   "https://prod.api.pvp.net/api",
          game:   "lol",
          region: "na",
        }.merge(params)
      end
      
      def api_url 
        @api_url ||= @options[:host] + "/" + @options[:game] + "/" + @options[:region]
      end
      
      def request_url
        raise StrategyNotFound, "Strategy not provided!" \
          if @options[:type].nil? || @options[:version].nil?
        @request_url ||= api_url + "/" + @options[:version] + "/" + @options[:type]
      end
      
    end
  end
  
end