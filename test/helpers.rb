require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter

SimpleCov.start do
  add_filter '/test/'
end

require 'rack/test'
require 'minitest/autorun'
require 'webmock/minitest'
require_relative '../server'

module Helpers
  def slack_token_out
    ENV['SLACK_TOKEN_OUT']
  end

  def slack_team
    'test_team'
  end

  def user_name
    'mickey'
  end

  # token team_id channel_id channel_name timestamp user_id user_name text
  def payload(text)
    {
      token:        slack_token_out,
      team_id:      slack_team,
      channel_id:   '0',
      channel_name: 'default',
      timestamp:    Time.now.utc.to_s,
      user_id:      '0',
      user_name:    user_name,
      text:         text,
      trigger:      'bikes'
    }
  end

  def bike_station(bikes=10, stands=10, number=222)
    Hashie::Mash.new({
      available_bikes: bikes,
      available_bike_stands: stands,
      number: number
    })
  end

  def app
    # use a module variable so the app is only ever initialised once
    # NOTE: possible source of nastiness doing this? makes tests run faster...
    unless defined? @@app
      config = File.read(File.join(File.dirname(__FILE__), '..', 'config.ru'))
      @@app = eval("Rack::Builder.new {(#{config})}")
    end
    @@app
  end
end
