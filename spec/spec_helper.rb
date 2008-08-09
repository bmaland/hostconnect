require 'rubygems'
require 'pp'
require 'spec'

require "./lib/hostconnect.rb"
include HostConnect

HostConnect.setup(:test, {
  :version => "2_05_300",
  :host => "127.0.0.1",
  :path => "/",
  :port => 80
})
