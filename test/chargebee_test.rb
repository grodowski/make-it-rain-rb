# frozen_string_literal: true
require 'minitest/autorun'
require 'rack/test'
require 'make_it_rain'

class ChargebeeTest < Minitest::Test
  include Rack::Test::Methods

  def app
    builder = Rack::Builder.new
    builder.run MakeItRain.new
  end

  def test_response_is_401_without_secret
    post '/'
    assert_equal last_response.status, 401
  end

  def test_does_not_parse_braintree_without_cb_amount
    post '/?secret=baconium', '{}'
    assert_equal last_response.status, 200
    assert_equal last_response.body, 'event skipped'
  end

  # TODO(janek): add more tests
end
