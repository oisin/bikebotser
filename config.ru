$: << File.dirname(__FILE__)

require 'server'

map '/' do
  run Server
end
