Rails.application.config.generators do |g|
  # Generate desired tests using RSpec.
  g.test_framework :rspec, :view_specs => false,
                           :controller_specs => false,
                           :request_specs => false,
                           :routing_specs => false

  # Use factory_girl for factories.
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'

  # Disable generators we don't need.
  g.stylesheets false
  g.javascripts false
  g.helper      false
end
