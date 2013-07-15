#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Dir.glob(File.expand_path("../lib/tasks/**/*.rake", __FILE__)).each { |f| load(f) }
 
Rake::TestTask.new do |t|
  t.libs << 'lib/ferret_users_and_groups'
  t.test_files = FileList['test/ferret_users_and_groups/**/*_test.rb']
  t.verbose = true
end
 
task :default => :test