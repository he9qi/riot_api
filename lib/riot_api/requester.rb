module RiotAPI
  module Requester
    
    def conn
      @conn ||= Faraday.new
    end
    
    def call(action, *args, &block)
      if action =~ /by_(.+)$/
        url = self.send action, *args[0]
      else
        url = self.send action
      end
      response = conn.get url + "?api_key=#{API.key}"
      response.body
    end
    
    def method_missing(meth, *args, &block)  
      if meth.to_s =~ /^find_(.+)$/
        call($1, *args, &block)
      else
        super
      end
    end
    
  end
end