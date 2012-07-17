# -*- encoding: utf-8 -*-
require File.expand_path('../lib/have/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sam Buna"]
  gem.email         = ["codective@gmail.com"]
  gem.description   = %q{Provide simple have?/has? methods}
  gem.summary       = %q{Provide simple have?/has? methods}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "have"
  gem.require_paths = ["lib"]
  gem.version       = Have::VERSION

  gem.add_development_dependency "rspec"
end
