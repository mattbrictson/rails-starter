set :application, "rails-starter"
set :repo_url, "ssh://git@bitbucket.org/55minutes/rails-starter.git"

# Project-specific overrides go here.
# For list of variables that can be customized, see:
# https://github.com/55minutes/capistrano-fiftyfive/blob/master/lib/capistrano/tasks/defaults.rake

set :fiftyfive_secrets_keys, %w(
  rails_secret_token
  postmark_api_key
)
