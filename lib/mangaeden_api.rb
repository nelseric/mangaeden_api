require "mangaeden_api/version"
require "mangaeden_api/configuration"
require "mangaeden_api/mangaeden"
require "mangaeden_api/manga"
require "mangaeden_api/chapter"

module MangaedenApi
  
  def self.setup
    yield self.configuration
  end

  def self.configuration
    @config ||= MangaedenApi::Configuration.instance
  end

end
