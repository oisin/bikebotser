require_relative 'helpers'

class TestAdmin < Minitest::Spec
  include Rack::Test::Methods
  include Helpers

  def test_status
    get '/status'
    last_response.body.must_equal(Admin.status_msg)
  end
end
