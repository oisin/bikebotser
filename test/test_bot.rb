require_relative 'helpers'

class TestBot < Minitest::Spec
  include Rack::Test::Methods
  include Helpers

  def setup
    ENV['SLACK_TOKEN_OUT'] = '0000000000000000'
    ENV['SLACK_TOKEN_IN'] = '1111111111111111'
    ENV['DECAUX_TOKEN'] = '2222222222222222'
    ENV['SLACK_TEAM'] = 'bikebotser'
  end

  def test_help
    %w{ help wat wtf }.each { |cmd|
      _(say(cmd)['text']).must_equal(Bot.help)
    }
  end

  def test_free_bikes
    station = bike_station
    Bot.stub :station, station do
      _(say("free #{station.number}")['text']).must_equal(Bot.bikes_free_message(station.available_bikes))
    end
  end

  def test_free_slots
    station = bike_station
    Bot.stub :station, station do
      _(say("slots #{station.number}")['text']).must_equal(Bot.slots_free_message(station.available_bike_stands))
    end
  end

  # Some of the commands just say sorry
  def test_sorries
    %w{ faves commutes scrub }.each { |cmd|
      _(say(cmd)['text']).must_equal(Bot.sorry(cmd, user_name))
    }
  end

  # Returns a hash of the result
  def say(cmd)
    data = payload("bikes #{cmd}")
    post '/', data
    case last_response.status
    when 200, 201
      JSON.parse(last_response.body)
    when 400..499
    when 500..599
      last_response.status.must_equal 200, JSON.parse(last_response.body)['error']
    end
  end
end
