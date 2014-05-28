module RiotAPI
  module API
    
    class StrategyNotRegistered < StandardError; end
    
    extend self
    
    def key
      @key
    end
    
    def setup(key) 
      @key = key
    end
    
    # register all strategies using the files in strategies folder
    def register_all
      dirs = Dir.entries File.join(File.expand_path(File.dirname(__FILE__)), "strategies") 
      dirs.delete(".")
      dirs.delete("..")
      dirs.map! { |dir| dir.sub(".rb", "") }
      dirs.each { |stra| register(stra) }
    end
    
    # register a strategy
    def register(strategy)
      stra_sym = :"@#{strategy}" 
      stra = instance_variable_get stra_sym
      if stra.nil?
        strategy_class = eval("RiotAPI::Strategies::#{strategy.camel_case}")
        instance_variable_set stra_sym, strategy_class.new.extend(RiotAPI::Requester)
        define_method(strategy) { instance_variable_get stra_sym }
      end
    end
    
    # call strategy with action and arguments
    def call(strategy, action, *args)
      stra = instance_variable_get :"@#{strategy}" 
      raise StrategyNotRegistered if stra.nil?
      stra.send action, args
    end
    
  end
end