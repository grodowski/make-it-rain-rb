# frozen_string_literal: true
$LOAD_PATH << '.'

require 'make_it_rain'
use Rack::CommonLogger, STDOUT
run MakeItRain.new
