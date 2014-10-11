require_relative 'helpers'

class TestBot < Minitest::Spec
  include Rack::Test::Methods
  include Helpers

  def setup
    ENV['SLACK_TOKEN_OUT'] = token
  end

  def test_help
    data = payload("bikes help")
    post '/', data
    last_response.status.must_equal 200
    assert_equal BotStuff.help, JSON.parse(last_response.body)['text']
  end
end
