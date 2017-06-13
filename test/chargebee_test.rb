# frozen_string_literal: true
require 'test/unit'
require 'rack/test'
require 'make_it_rain'

class ChargebeeTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run MakeItRain.new
  end

  def test_response_is_403_without_secret
    get '/'
    assert_equal last_response.status, 401
  end
end
