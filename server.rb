require 'sinatra'
require_relative 'lib/bot'

class Server < Sinatra::Base
  set :show_exceptions, true

  helpers Bot

  post '/' do
    Bot.bot.handle_item(params)
  end

  get '/status' do
    "Bikebotser is running."
  end
end
