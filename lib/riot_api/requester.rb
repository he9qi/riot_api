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
      resp = conn.get url, api_key: API.key
      resp = resp[0] if resp.is_a?(Array)
      resp.body
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