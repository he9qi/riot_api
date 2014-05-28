# champion-v1.2

module Riot
  module Strategies
    
    class Champion < Default
      
      def initialize(params={})
        options = {
          version: "v1.2",
          type: "champion"
        }.merge(params)
        super options
      end
      
      def all
        request_url
      end
      
      def by_id(id)
        request_url + "/" + id
      end
      
    end
  end
end