# Staging configuration is identical to production, with some overrides
# for hostname, API keys, etc.

require_relative './production'

RailsStarter::Application.configure do

  # Production mailer config
  config.to_prepare do
    ActionMailer::Base.simple_postmark_settings = {
      api_key: 'xxxxxxxx'
    }
  end
  config.action_mailer.default_url_options = {
    host: 'staging.rails-starter.com',
    protocol: 'http' # or 'https' for a secured app
  }
end
