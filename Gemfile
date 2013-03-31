source 'https://rubygems.org'

gem 'bcrypt-ruby',  '~> 3.0.0'
gem 'draper'
gem 'ie_conditional_tag'
gem 'jquery-rails', '~> 2.2.1'
gem 'pg'
gem 'rails',        '3.2.13'
gem 'turbolinks'

# Other gems to consider
# gem 'activeadmin', '0.5.1' # `rails g active_admin:assets` when upgrading
# gem 'cancan'
# gem 'devise'
# gem 'dragonfly'
# gem 'friendly_id'
# gem 'informal'
# gem 'jbuilder'
# gem 'kaminari'
# gem 'rack-mini-profiler'
# gem 'redcarpet'
# gem 'simple_form'


# Gems used only for assets and not required
# in production environments by default.
#
group :assets do
  gem 'bourbon'
  gem 'coffee-rails',    '~> 3.2.1'
  gem 'normalize-rails', '~> 2.0.1'
  gem 'sass-rails',      '~> 3.2.3'
  gem 'turbo-sprockets-rails3'
  gem 'uglifier',        '>= 1.0.3'

  # Other asset pipeline gems to consider
  # gem 'bootstrap-sass'
  # gem 'compass-rails'
  # gem 'jquery-ui-rails', '~> 4.0.1'
  # gem 'neat'
end

# Gems that facilitate development but are not required to run the app.
# Note `require: false` for those gems that are purely command-line tools.
#
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano',              require: false
  gem 'capistrano-maintenance',  require: false
  gem 'guard-livereload',        require: false
  gem 'guard-rspec',             require: false
  gem 'letter_opener'
  gem 'powder',                  require: false
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'rb-fsevent',              require: false
  gem 'terminal-notifier-guard', require: false
  gem 'thin',                    require: false

  # Other development gems to consider
  # gem 'brakeman',  require: false
  # gem 'debugger'
  # gem 'rails-erd'
  # gem 'vendorer'
end

# Gems needed for running tests.
# Note that some of these are also used in :development for Rails generators.
#
group :test do
  gem 'capybara'
  gem 'factory_girl_rails', group: :development
  gem 'launchy'
  gem 'rspec-rails',        group: :development
end

# Gems needed in production environments only.
#
group :production, :staging do
  gem 'exception_notification'
  gem 'simple_postmark'
  gem 'unicorn', require: false
end
