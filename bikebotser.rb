require 'sinatra'
require_relative 'lib/botstuff'

class BikeBotser < Sinatra::Base
  set :show_exceptions, true

  helpers BotStuff

  post '/' do
    BotStuff.bot.handle_item(params)
  end

  get '/status' do
    "Bikebotser is running."
  end
end
