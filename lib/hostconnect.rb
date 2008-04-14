# This file begins the loading sequence.
pwd = File.dirname(__FILE__)

# This line just let's us require anything in the +lib+ sub-folder
# without specifying a full path.
$LOAD_PATH.unshift(pwd)

# Require dependencies
%w[rubygems net/https builder xmlsimple date time ostruct
   active_support/inflector active_support/core_ext/blank
   active_support/core_ext/string].each { |lib| require lib }

# Require HostConnect files
require "#{pwd}/hostconnect/config"
require "#{pwd}/hostconnect/client"
require "#{pwd}/hostconnect/response"
require "#{pwd}/hostconnect/builder"
require "#{pwd}/hostconnect/coercion"

Dir.glob("#{pwd}/hostconnect/builders/*.rb").each { |file| require file }
Dir.glob("#{pwd}/hostconnect/responses/*.rb").each { |file| require file }
Dir.glob("#{pwd}/hostconnect/core_extensions/*.rb").each { |file| require file }
