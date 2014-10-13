$: << File.dirname(__FILE__)

require 'admin_server'
require 'bot_server'

map '/bot' do
  run BotServer
end

map '/' do
  run AdminServer
end

map '/assets' do
  run Rack::Directory.new('./assets')
end
