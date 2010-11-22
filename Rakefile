#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'rake'
require 'rake/rdoctask'
require 'rspec/core/rake_task'

task :default => 'spec'

desc "Run specifications"
RSpec::Core::RakeTask.new('spec') do |t|
  unless ENV["NO_RCOV"]
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
end

DOCUMENTED_FILES = FileList['CHANGELOG', 'README.markdown',
                            'MIT-LICENSE', 'lib/**/*.rb']

desc "Generate Documentation"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "HostConnect"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README.markdown'
  rdoc.rdoc_files.include(*DOCUMENTED_FILES)
end
