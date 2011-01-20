# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "squiggle/version"

Gem::Specification.new do |s|
  s.name        = "squiggle"
  s.version     = Squiggle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Turnbul"]
  s.email       = ["james@lovedthanlost.net"]
  s.homepage    = "http://github.com/jamtur01/squiggle"
  s.summary     = %q{Puppet API wrapper}
  s.description = %q{squiggle is a squiggly Puppet API wrapper.}

  s.rubyforge_project = "squiggle"
  
  s.add_dependency "rest-client"
  
  s.add_development_dependency "yard", "~> 0.6.4"
  s.add_development_dependency "rspec", "~> 2.4.0"
  s.add_development_dependency "rcov"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
