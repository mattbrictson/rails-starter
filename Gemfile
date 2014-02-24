source 'https://rubygems.org'

# Note that the release versions of these gems may not yet be compatible
# with Rails 4. Get up-to-date compatibility information by uploading this
# Gemfile to http://ready4rails4.net

gem 'bcrypt-ruby',       '~> 3.1.2'
gem 'bourbon'
gem 'coffee-rails',      '~> 4.0.0'
gem 'dotenv-rails'
gem 'jquery-rails'
gem 'marco-polo',        '~> 1.0'
gem 'normalize-rails',   '~> 3.0.0'
gem 'pg'
gem 'rails',             '4.0.3'
gem 'sass-rails',        '~> 4.0.0'
gem 'secure_headers'
gem 'turbolinks'
gem 'uglifier',          '>= 1.3.0'

# Other gems to consider
# gem 'activeadmin', '0.6.0' # `rails g active_admin:assets` when upgrading
# gem 'devise'
# gem 'dragonfly'
# gem 'facets', :require => false
# gem 'font-awesome-rails'
# gem 'friendly_id'
# gem 'jbuilder', '~> 1.2'
# gem 'jquery-ui-rails'
# gem 'kaminari'
# gem 'mail_view'
# gem 'neat'
# gem 'pundit'
# gem 'rack-mini-profiler'
# gem 'redcarpet'
# gem 'select2-rails'
# gem 'state_machine'


# Gems that facilitate development but are not required to run the app.
# Note `:require => false` for those gems that are purely command-line tools.
#
group :development do
  gem 'annotate', '>=2.5.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman',                :require => false
  gem 'capistrano', '~> 3.1.0',  :require => false
  gem 'capistrano-bundler',      :require => false
  gem 'capistrano-fiftyfive',    :require => false,
                                 :github => '55minutes/capistrano-fiftyfive'
  gem 'capistrano-rails',        :require => false
  gem 'guard', '>= 2.2.2',       :require => false
  gem 'guard-livereload',        :require => false
  gem 'guard-rspec',             :require => false
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'rb-fsevent',              :require => false
  gem 'sshkit',                  :require => false,
                                 :github => 'capistrano/sshkit'
  gem 'terminal-notifier-guard', :require => false
  gem 'thin',                    :require => false
  gem 'xray-rails'

  # Other development gems to consider
  # gem 'debugger'
  # gem 'guard-shell', :require => false
  # gem 'license_finder', :require => false
  # gem 'rails-erd'
  # gem 'ruby-prof', :require => false
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
