# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require "hostconnect/version"

Gem::Specification.new do |s|
  s.name = %q{hostconnect}
  s.version = HostConnect::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Bjørn Arild Mæland", "Amund Sivertsen"]
  s.description = %q{Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.}
  s.summary = %q{Library for interfacing with Tourplan's hostConnect software, which is a web service interface for tour booking.}
  s.email = %q{bjorn.maeland@gmail.com}
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec`.split("\n")
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bmaland/hostconnect/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Hostconnect", "--main", "README.markdown"]
  s.require_path = "lib"
  s.rubyforge_project = %q{hostconnect}
  s.required_rubygems_version = ">= 1.3.6"
  s.license = "MIT"

  s.add_dependency "activesupport", ">= 2.3.10", "< 5.3.0"
  s.add_dependency "builder", "2.1.2"
  s.add_dependency "hpricot"
  s.add_dependency "rtf"

  s.add_development_dependency "rcov"
  s.add_development_dependency "rspec", "~> 2.1.0"
end
