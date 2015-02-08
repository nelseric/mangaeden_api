# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mangaeden_api/version'

Gem::Specification.new do |s|
  s.platform      = Gem::Platform::RUBY
  s.name          = 'mangaeden_api'
  s.version       = MangaedenApi::VERSION
  s.authors       = ['Luca Ferri']
  s.email         = ['luca.ferri88@gmail.com']
  s.description   = 'A Mangaeden API wrapper'
  s.summary       = 'Wrapper for Mangaeden API (http://www.mangaeden.com/api/)'
  s.homepage      = 'http://lucaferri.github.io/mangaeden_api'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency('json', '~> 1.8')
end
