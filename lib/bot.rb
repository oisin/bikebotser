require  'slackbotsy'

module Bot

  def self.help
    "free <station>   - show number of free bikes at station\n" +
    "slots <station>  - show number of free slots for parking bikes at station\n" +
    "help             - list these commands\n"
  end

  def self.sorry(cmd, user)
    "#{cmd.capitalize} not implemented at this time, sorry #{user.capitalize}!"
  end

  def self.config
    {
      'team'           => ENV['SLACK_TEAM'] || 'bikebotser',
      'channel'        => ENV['SLACK_CHANNEL'] || '#default',
      'incoming_token' => ENV['SLACK_TOKEN_IN'],
      'outgoing_token' => ENV['SLACK_TOKEN_OUT'],
      'name'           => 'bikebotser'
    }
  end

  def self.bot
    Slackbotsy::Bot.new(Bot.config) do
      hear /free\s+([0-9]+)/ do |matched|
        "I don't know what is free at station #{matched[1]}"
      end

      hear /slots\s+([0-9]+)/ do |matched|
        "I don't know how many slots available at station #{matched[1]}"
      end

      hear /fave(.*)/ do
        Bot.sorry('faves', user_name)
      end

      hear /commute(.*)/ do
        Bot.sorry('commutes', user_name)
      end

      hear /scrub(.*)/ do
        Bot.sorry('scrub', user_name)
      end

      hear /help|wat|wtf|\?+/ do
        Bot.help
      end
    end
  end
end
