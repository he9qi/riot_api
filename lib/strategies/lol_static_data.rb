# lol-static-data-v1.2

module Riot
  module Strategies
    
    class LolStaticData < Default
      
      def initialize(params={})
        options = {
          version: "v1.2",
          type: "static-data"
        }.merge(params)
        super options
      end
      
      [:champion, :item, :mastery, :rune, :summoner_spell].each do |action|
        meth      = action.to_s
        meth_dash = meth.sub('_','-')
        define_method(meth) { request_url + "/#{meth_dash}" }
        define_method("#{meth}_by_id") do |id|
          request_url + "/#{meth_dash}/" + id
        end
      end
      
      def api_url 
        @api_url ||= @options[:host] + "/" + @options[:game] + "/" + \
                     @options[:type] + "/" + @options[:region]
      end
      
      def request_url
        @request_url ||= api_url + "/" + @options[:version]
      end
      
      def versions
        request_url + "/versions"
      end
      
      def realm
        request_url + "/realm"
      end
      
    end
  end
end