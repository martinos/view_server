#!/usr/bin/env rake
require 'bundler'
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "spec/*_spec.rb"
  # To avoid requirement of File.expand_path(File.dirname(__FILE__) + 'test_helper') from test files
  t.libs << 'spec'
end


task :default => [:test] 

