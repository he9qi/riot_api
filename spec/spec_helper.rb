$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "riot_api"