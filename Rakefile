#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'echoe'

PROJECT = 'hostconnect'

Echoe.new(PROJECT) do |p|
  p.author = "Bjørn Arild Mæland"
  p.summary = "Library for interfacing with Tourplan's hostConnect software,
which is a web service interface for tour booking."
  p.url = "http://www.github.com/Chrononaut/hostconnect/"
  p.dependencies = ["activesupport", "hpricot", "builder", "rtf"]
  p.ignore_pattern = FileList[".gitignore"]
  p.include_rakefile = true
end

task :default => 'spec'

desc "Run specifications"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = FileList[(ENV['FILES'] || 'spec/**/*_spec.rb')]
  unless ENV["NO_RCOV"]
    #t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
end

desc "Create spec docs"
Spec::Rake::SpecTask.new('spec_docs') do |t|
  t.spec_opts = ["--format", "html:spec_docs.html"]
  t.spec_files = FileList[(ENV['FILES'] || 'spec/**/*_spec.rb')]
end

DOCUMENTED_FILES = FileList['README.markdown', 'MIT-LICENSE', 'lib/**/*.rb']

desc "Generate Documentation"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "HostConnect"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README.markdown'
  rdoc.rdoc_files.include(*DOCUMENTED_FILES)
end
