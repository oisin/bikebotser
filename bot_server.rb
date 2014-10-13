require 'sinatra'
require_relative 'lib/bot'

class BotServer < Sinatra::Base
  set :show_exceptions, false
  set :raise_errors, false

  helpers Bot

  post '/' do
    begin
      Bot.bot.handle_item(params)
    rescue StandardError => e
      [500, {}, { error: e.message }.to_json]
    end
  end
end
