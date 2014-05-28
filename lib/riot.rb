module Riot
  require 'faraday'
  require 'extlib'
  
  require_relative 'strategies/default'
  require_relative 'strategies/summoner'
  require_relative 'strategies/team'
  require_relative 'strategies/champion'
  require_relative 'strategies/game'
  require_relative 'strategies/league'
  require_relative 'strategies/stats'
  require_relative 'strategies/lol_static_data'
  
  require_relative 'api'
  require_relative 'requester'
  
  def self.logger=(logger)
    @logger = logger
  end
  
  def self.logger
    @logger ||= Logger.new($stdout).tap do |log|
      log.progname = 'Riot'
    end
  end
  
end
