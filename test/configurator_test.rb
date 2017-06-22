# frozen_string_literal: true

require 'minitest/autorun'
require 'rack/test'

class ConfiguratorTest < Minitest::Test
  include Rack::Test::Methods

  def app
    MakeItRain::Wrapper
  end

  def test_configurator_response
    get '/configure'
    assert_equal 200, last_response.status
  end
end
