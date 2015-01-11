require 'coveralls'
Coveralls.wear!

require 'bundler/setup'
Bundler.setup

require 'mangaeden_api'
require 'webmock/rspec'
require 'vcr'


#VCR config
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/mangaeden_api'
  config.hook_into :webmock
end

#RSPEC config
RSpec.configure do |config|
end