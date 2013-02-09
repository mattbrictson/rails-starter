require 'spec_helper'
require 'capybara/rspec'

# Put your features spec helpers inside spec/features/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
