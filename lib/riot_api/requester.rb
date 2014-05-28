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
      
      parse resp
    end
    
    def method_missing(meth, *args, &block)  
      if meth.to_s =~ /^find_(.+)$/
        call($1, *args, &block)
      else
        super
      end
    end
    
    private
  
    # get response body, if the body is nil or we fail
    # to parse the body, return nil
    def parse(resp)
      resp = resp[0] if resp.is_a?(Array)
      resp = resp.body
      begin 
        JSON.parse resp
      rescue JSON::ParserError, TypeError
        nil
      end
    end
    
  end
end