require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "hornet-connector-ruby"
    gem.summary = %Q{Hornet Ruby Connector - Realtime engine for webapps}
    gem.description = %Q{Hornet Ruby Connector is a connector for Hornet, a realtime engine backed by Redis and Socket.io}
    gem.email = "robin.komiwes@gmail.com"
    gem.homepage = "http://github.com/nectify/hornet-connector-ruby"
    gem.authors = ["Robin Komiwes", "Benjamin Tierny", "Tristan Bourgois", "Maxime Brazeilles"]
    gem.rubyforge_project = "hornet-connector-ruby"
    gem.add_dependency 'alphadecimal'
  end
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "hornet-connector-ruby #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
