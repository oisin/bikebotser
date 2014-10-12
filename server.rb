require 'sinatra'
require_relative 'lib/bot'
require_relative 'lib/admin'

class Server < Sinatra::Base
  set :show_exceptions, false
  set :raise_errors, false

  helpers Bot
  helpers Admin

  post '/' do
    begin
      Bot.bot.handle_item(params)
    rescue StandardError => e
      [500, {}, { error: e.message }.to_json]
    end
  end

  get '/status' do
    Admin.status_msg
  end
end
