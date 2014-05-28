module Riot
  module API
    
    class StrategyNotRegistered < StandardError; end
    
    extend self
    
    def key
      @key
    end
    
    def setup(key) 
      @key = key
    end
    
    def register(strategy)
      stra_sym = :"@#{strategy}" 
      stra = instance_variable_get stra_sym
      if stra.nil?
        strategy_class = eval("Riot::Strategies::#{strategy.camel_case}")
        instance_variable_set stra_sym, strategy_class.new.extend(Riot::Requester)
        define_method(strategy) { instance_variable_get stra_sym }
      end
    end
    
    def call(strategy, action, *args)
      stra = instance_variable_get :"@#{strategy}" 
      if stra.nil?
        raise StrategyNotRegistered
      else
        stra.send action, args
      end
    end
    
  end
end