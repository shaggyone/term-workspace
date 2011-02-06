# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "term-workspace/version"

Gem::Specification.new do |s|
  s.name        = "term-workspace"
  s.version     = Term::Workspace::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shaggyone"]
  s.email       = ["victor@zagorski.ru"]
  s.homepage    = ""
  s.summary     = %q{}
  s.description = %q{}

  s.rubyforge_project = "term-workspace"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
