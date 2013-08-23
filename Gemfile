source 'https://rubygems.org'

# Note that the release versions of these gems may not yet be compatible
# with Rails 4. Get up-to-date compatibility information by uploading this
# Gemfile to http://ready4rails4.net

gem 'bcrypt-ruby',       '~> 3.0.0'
gem 'bourbon'
gem 'coffee-rails',      '~> 4.0.0'
gem 'jquery-rails'
gem 'normalize-rails',   '~> 2.1.1'
gem 'pg'
gem 'rails',             '4.0.0'
gem 'sass-rails',        '~> 4.0.0'
gem 'secure_headers'
gem 'turbolinks'
gem 'uglifier',          '>= 1.3.0'

# Other gems to consider
# gem 'activeadmin', '0.6.0' # `rails g active_admin:assets` when upgrading
# gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'
# gem 'cancan'
# gem 'compass-rails'
# gem 'devise'
# gem 'draper'
# gem 'dragonfly'
# gem 'facets', :require => false
# gem 'font-awesome-rails'
# gem 'friendly_id'
# gem 'informal'
# gem 'jbuilder', '~> 1.2'
# gem 'jquery-ui-rails'
# gem 'kaminari'
# gem 'mail_view'
# gem 'neat'
# gem 'rack-mini-profiler'
# gem 'redcarpet'
# gem 'select2-rails'
# gem 'simple_form'
# gem 'state_machine'


# Gems that facilitate development but are not required to run the app.
# Note `:require => false` for those gems that are purely command-line tools.
#
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman',                :require => false
  gem 'capistrano',              :require => false
  gem 'capistrano-fiftyfive',    :require => false, :github => '55minutes/capistrano-fiftyfive', :branch => :master
  gem 'guard-livereload',        :require => false
  gem 'guard-rspec',             :require => false
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'rb-fsevent',              :require => false
  gem 'terminal-notifier-guard', :require => false
  gem 'thin',                    :require => false
  gem 'xray-rails'

  # Other development gems to consider
  # gem 'debugger'
  # gem 'guard-shell', :require => false
  # gem 'license_finder', :require => false
  # gem 'rails-erd'
end


# Gems needed for running tests.
# Note that some of these are also used in :development for Rails generators.
#
group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails', :group => :development
  gem 'launchy'
  gem 'rspec-rails',        :group => :development

  # Other test gems to consider
  # gem 'capybara-email'
  # gem 'shoulda-matchers'
  # gem 'timecop'
end


# Gems needed in production environments only.
#
group :production, :staging do
  gem 'exception_notification'
  gem 'postmark-rails'
  gem 'unicorn', :require => false
end
