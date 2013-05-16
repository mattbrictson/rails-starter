source 'https://rubygems.org'

gem 'bcrypt-ruby',       '~> 3.0.0'
gem 'bourbon'
gem 'coffee-rails',      '~> 4.0.0'
gem 'ie_conditional_tag'
gem 'jquery-rails',      '~> 2.2.1'
gem 'normalize-rails',   '~> 2.0.1'
gem 'pg'
gem 'rails',             '4.0.0.rc1'
gem 'sass-rails',        '~> 4.0.0.rc1'
gem 'secure_headers'
gem 'turbolinks'
gem 'uglifier',          '>= 1.3.0'

# Other gems to consider
# gem 'activeadmin', '0.6.0' # `rails g active_admin:assets` when upgrading
# gem 'anjlab-bootstrap-rails', require: 'bootstrap-rails'
# gem 'cancan'
# gem 'compass-rails'
# gem 'devise'
# gem 'draper'
# gem 'dragonfly'
# gem 'font-awesome-rails'
# gem 'friendly_id'
# gem 'informal'
# gem 'jbuilder', '~> 1.0.1'
# gem 'jquery-ui-rails'
# gem 'kaminari'
# gem 'neat'
# gem 'rack-mini-profiler'
# gem 'redcarpet'
# gem 'select2-rails'
# gem 'simple_form'


# Gems that facilitate development but are not required to run the app.
# Note `require: false` for those gems that are purely command-line tools.
#
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano',              require: false
  gem 'guard-livereload',        require: false
  gem 'guard-rspec',             require: false
  gem 'letter_opener'
  gem 'powder',                  require: false
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'rb-fsevent',              require: false
  gem 'terminal-notifier-guard', require: false
  gem 'thin',                    require: false
  gem 'xray-rails'

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
