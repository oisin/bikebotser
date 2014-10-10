require 'slackbotsy'
require 'sinatra'

config = {
  'team'           => ENV['SLACK_TEAM'] || 'bikebotser',
  'channel'        => ENV['SLACK_CHANNEL'] || '#default',
  'incoming_token' => ENV['SLACK_TOKEN_IN'],
  'outgoing_token' => ENV['SLACK_TOKEN_OUT'],
  'name'           => 'bikebotser',
}

bot = Slackbotsy::Bot.new(config) do
  hear /free\s+([0-9]+)/ do |matched|
    "I don't know what is free at station #{matched[1]}"
  end

  hear /slots\s+([0-9]+)/ do |matched|
    "I don't know how many slots available at station #{matched[1]}"
  end

  hear /fave(.*)/ do
    "Faves are not implemented at this time, sorry #{user_name}!"
  end

  hear /commute(.*)/ do
    "Commutes is not implemented at this time, sorry #{user_name}!"
  end

  hear /scrub(.*)/ do
    "Scrub is not implemented at this time, sorry #{user_name}!"
  end

  hear /help|wat|wtf|\?+/ do
    "free <station>   - show number of free bikes at station\n" +
    "slots <station>  - show number of free slots for parking bikes at station\n" +
    "help             - list these commands\n"
  end
end

post '/' do
  bot.handle_item(params)
end

get '/status' do
  "Bikebotser is running."
end
