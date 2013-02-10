module Features
  module Paths
    # Put helper methods related to the paths in your application here.

    def homepage
      "/"
    end
  end
end

RSpec.configuration.include Features::Paths, :type => :feature
