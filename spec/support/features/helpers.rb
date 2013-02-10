module Features
  module Helpers
  # Put helper methods you need to be available in all feature specs here.

  end
end

RSpec.configuration.include Features::Helpers, :type => :feature
