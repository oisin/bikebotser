require 'slackbotsy'
require 'bikes'

module Bot

  def self.help
    "free <station>   - show number of free bikes at station\n" +
    "slots <station>  - show number of free slots for parking bikes at station\n" +
    "help             - list these commands\n"
  end

  def self.sorry(cmd, user)
    "#{cmd.capitalize} not implemented at this time, sorry #{user.capitalize}!"
  end

  def self.bike_token
    ENV['DECAUX_TOKEN']
  end

  def self.bike_scheme
    ENV['BIKEBOTSER_SCHEME'] || 'Dublin'
  end

  def self.station(num)
    Bikes.new(Bot.bike_token, Bot.bike_scheme).station(num)
  end

  def self.config
    enforce_mandatory_env
    {
      'team'           => ENV['SLACK_TEAM'],
      'channel'        => ENV['SLACK_CHANNEL'] || '#default',
      'incoming_token' => ENV['SLACK_TOKEN_IN'],
      'outgoing_token' => ENV['SLACK_TOKEN_OUT'],
      'name'           => 'bikebotser'
    }
  end

  def self.enforce_mandatory_env
    %w{ DECAUX_TOKEN SLACK_TOKEN_IN SLACK_TOKEN_OUT SLACK_TEAM }.each { |var|
      ENV[var] || (raise ArgumentError.new("Required ENV key #{var} missing"))
    }
  end

  def self.bikes_free_message(n)
    "#{n} bikes available"
  end

  def self.slots_free_message(n)
    "#{n} slots available"
  end

  def self.bot
    Slackbotsy::Bot.new(Bot.config) do
      hear (/free\s+([0-9]+)/) do |matched|
        Bot.bikes_free_message(Bot.station(matched[1]).available_bikes)
      end

      hear (/slots\s+([0-9]+)/) do |matched|
        Bot.slots_free_message(Bot.station(matched[1]).available_bike_stands)
      end

      hear (/fave(.*)/) do
        Bot.sorry('faves', user_name)
      end

      hear (/commute(.*)/) do
        Bot.sorry('commutes', user_name)
      end

      hear (/scrub(.*)/) do
        Bot.sorry('scrub', user_name)
      end

      hear (/help|wat|wtf|\?+/) do
        Bot.help
      end
    end
  end
end
