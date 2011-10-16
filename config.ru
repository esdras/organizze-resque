#!/usr/bin/env ruby
require 'logger'

$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/lib')
require 'resque/server'

# Set the RESQUECONFIG env variable if you've a `resque.rb` or similar
# config file you want loaded on boot.
require File.expand_path(File.join(File.dirname(__FILE__), 'config', 'redis'))

# HTTP Auth For Resque Console
AUTH_PASSWORD = ENV["RESQUE_PASSWORD"]
if AUTH_PASSWORD
  Resque::Server.use Rack::Auth::Basic do |username, password|
    password == AUTH_PASSWORD
  end
end


use Rack::ShowExceptions
run Resque::Server.new
