#!/usr/bin/env ruby

require 'rubygems'
require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/contrib/rubyforgepublisher'

PROJECT = 'hostconnect'

desc "Run specifications"
Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = FileList[(ENV['FILES'] || 'spec/**/*_spec.rb')]
  unless ENV["NO_RCOV"]
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end
end

desc "Create spec docs"
Spec::Rake::SpecTask.new('spec_docs') do |t|
  t.spec_opts = ["--format", "html:spec_docs.html"]
  t.spec_files = FileList[(ENV['FILES'] || 'spec/**/*_spec.rb')]
end

DOCUMENTED_FILES = FileList['README', 'MIT-LICENSE', 'lib/**/*.rb']

desc "Generate Documentation"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = "HostConnect"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README'
  rdoc.rdoc_files.include(*DOCUMENTED_FILES)
end

