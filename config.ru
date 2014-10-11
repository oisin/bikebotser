$: << File.dirname(__FILE__)

require 'bikebotser'

map '/' do
  run BikeBotser
end
