# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hornet-connector-ruby}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Komiwes", "Benjamin Tierny", "Tristan Bourgois", "Maxime Brazeilles"]
  s.date = %q{2011-06-17}
  s.description = %q{Hornet Ruby Connector is a connector for Hornet, a realtime engine backed by Redis and Socket.io}
  s.email = %q{robin.komiwes@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "hornet-connector-ruby.gemspec",
     "init.rb",
     "lib/hornet.rb",
     "test/hornet-connector-ruby_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/nectify/hornet-connector-ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hornet-connector-ruby}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Hornet Ruby Connector - Realtime engine for webapps}
  s.test_files = [
    "test/hornet-connector-ruby_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<alphadecimal>, [">= 0"])
    else
      s.add_dependency(%q<alphadecimal>, [">= 0"])
    end
  else
    s.add_dependency(%q<alphadecimal>, [">= 0"])
  end
end
