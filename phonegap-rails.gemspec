# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phonegap/rails/version'

Gem::Specification.new do |gem|
  gem.name          = "phonegap-rails"
  gem.version       = Phonegap::Rails::VERSION
  gem.authors       = ["Josep Casals"]
  gem.email         = ["joscas@gmail.com"]
  gem.description   = %q{Export a rails single page app as a Phonegap project}
  gem.summary       = %q{Handle asset pipeline and generate Phonegap projects for single page web apps such as Ember-Rails apps}
  gem.homepage      = "http://rubygems.org/gems/phonegap-rails"
  
  #gem.add_development_dependency "rspec"
  #gem.add_dependency "sprockets"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end