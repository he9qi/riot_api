require File.expand_path('../lib/riot_api/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'riot_api_ruby'
  s.version     = RiotAPI::VERSION
  s.date        = '2014-05-28'
  s.summary     = "Ruby Riot Game API Wrapper."
  s.description = <<-DESC
    Yet another ruby Riot game league of legend api wrapper.
  DESC
  s.authors     = ["Qi He"]
  s.email       = 'qihe229@gmail.com'
  s.homepage    = 'http://github.com/he9qi/riot_api'
  s.license     = 'MIT'
  
  s.files         = Dir.glob('lib/**/*.rb')
  s.require_paths = ['lib']
  s.test_files    = Dir.glob('spec/**/*.rb')
  
  s.add_runtime_dependency "faraday", '~> 0.9.0'
  s.add_runtime_dependency "extlib", '~> 0.9.16'
end