# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'view_server/version'

Gem::Specification.new do |gem|
  gem.name          = "view_server"
  gem.version       = ViewServer::VERSION
  gem.add_dependency "main"
  gem.add_dependency "clipboard"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "bundler", "~> 1.0"
  gem.add_development_dependency "minitest", "~> 5.0"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "pry-nav"
  gem.add_development_dependency "colored"
  gem.add_development_dependency "mocha"

  gem.authors       = ["Martin Chabot"]
  gem.email         = ["chabotm@gmail.com"]
  gem.description   = %q{Allow local viewing of remote files}
  gem.summary       = %q{Allow local viewing of remote files}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
