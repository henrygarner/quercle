# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "quercle/version"

Gem::Specification.new do |s|
  s.name        = "quercle"
  s.version     = Quercle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Henry Garner"]
  s.email       = ["henry.garner@mac.com"]
  s.homepage    = ""
  s.summary     = %q{JSON -> Query conditions}
  s.description = %q{Converts JSON hash representing SQL conditions into an array suitable for ActiveRecord or DataMapper queries}

  s.rubyforge_project = "quercle"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "json"
  s.add_development_dependency "rspec"
end
