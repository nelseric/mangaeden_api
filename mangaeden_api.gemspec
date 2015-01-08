# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mangaeden_api/version'

Gem::Specification.new do |gem|
  gem.platform      = Gem::Platform::RUBY
  gem.name          = "mangaeden_api"
  gem.version       = MangaedenApi::VERSION
  gem.authors       = ["Luca Ferri"]
  gem.email         = ["luca.ferri88@gmail.com"]
  gem.description   = %q{A Mangaeden API wrapper}
  gem.summary       = %q{Wrapper for Mangaeden API (http://www.mangaeden.com/api/)}
  gem.homepage      = "http://lucaferri.github.io/mangaeden_api"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency("json", "~> 1.8")

  gem.post_install_message = "Thank for installing!"

end
