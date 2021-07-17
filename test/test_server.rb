require_relative 'helpers'

class TestServer < Minitest::Spec
  include Rack::Test::Methods
  include Helpers

  def test_status
    get '/status'
    _(last_response).body.must_equal(Admin.status_msg)
  end
end
