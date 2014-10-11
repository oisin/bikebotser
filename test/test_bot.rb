require_relative 'helpers'

class TestBot < Minitest::Spec
  include Rack::Test::Methods
  include Helpers

  def setup
    ENV['SLACK_TOKEN_OUT'] = token
  end

  def test_help
    %w{ help wat wtf }.each { |cmd|
      assert_equal Bot.help, say(cmd)['text']
    }
  end

  def test_sorries
    %w{ faves commutes scrub }.each { |cmd|
      assert_equal Bot.sorry(cmd, user_name), say(cmd)['text']
    }
  end

  # Returns a hash of the result
  def say(cmd)
    data = payload("bikes #{cmd}")
    post '/', data
    last_response.status.must_equal 200
    JSON.parse(last_response.body)
  end
end
