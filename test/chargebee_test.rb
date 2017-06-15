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
    assert_equal 401, last_response.status
  end

  def test_does_not_parse_braintree_without_cb_amount
    post '/?secret=baconium', '{}'
    assert_equal 200, last_response.status
    assert_equal 'event skipped', last_response.body
  end

  def test_skips_except_payment_succeeded
    req_body = {
      content: { transaction: { amount: 1_000 } },
      event_type: 'payment_failed'
    }
    post '/?secret=baconium', req_body.to_json
    assert_equal 200, last_response.status
    assert_equal 'event skipped', last_response.body
  end

  # TODO(janek): add more tests
end
