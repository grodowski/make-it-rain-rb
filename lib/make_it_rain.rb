# frozen_string_literal: true

Bundler.require
require 'make_it_rain/environment'
require 'make_it_rain/slack'
require 'make_it_rain/app'

# Main application module
module MakeItRain
  Configurator = ->(_env) { [200, {}, ['Hello, World!']] }

  Wrapper = Rack::Builder.new do
    map('/') { run App.new }
    map('/configure') { run Configurator }
  end
end
