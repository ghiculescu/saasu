# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name        = "saasu"
  gem.summary     = "Expanded Fork of Ruby wrapper for the Saasu api"
  gem.description = "Expanded Fork of Ruby wrapper for the Saasu api. Originally written by Keiran Johnson, it has had features added to it in order to suit the needs of Agworld Pty Ltd by Chris Kruger"
  gem.email       = "hello@invisiblelines.com"
  gem.homepage    = "http://github.com/agworld/saasu"
  gem.authors     = ["Kieran Johnson, Chris Kruger"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
