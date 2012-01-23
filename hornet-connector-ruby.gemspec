# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hornet-connector-ruby"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Komiwes", "Benjamin Tierny", "Tristan Bourgois", "Maxime Brazeilles"]
  s.date = "2012-01-23"
  s.description = "Hornet Ruby Connector is a connector for Hornet, a realtime engine backed by Redis and Socket.io"
  s.email = "robin.komiwes@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "hornet-connector-ruby.gemspec",
    "init.rb",
    "lib/hornet.rb",
    "test/hornet-connector-ruby_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "http://github.com/nectify/hornet-connector-ruby"
  s.require_paths = ["lib"]
  s.rubyforge_project = "hornet-connector-ruby"
  s.rubygems_version = "1.8.11"
  s.summary = "Hornet Ruby Connector - Realtime engine for webapps"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<alphadecimal>, ["= 1.1.1"])
      s.add_runtime_dependency(%q<redis>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<alphadecimal>, [">= 0"])
    else
      s.add_dependency(%q<alphadecimal>, ["= 1.1.1"])
      s.add_dependency(%q<redis>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<alphadecimal>, [">= 0"])
    end
  else
    s.add_dependency(%q<alphadecimal>, ["= 1.1.1"])
    s.add_dependency(%q<redis>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<alphadecimal>, [">= 0"])
  end
end

