source 'https://rubygems.org'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'draper'
gem 'jquery-rails'
gem 'pg'
gem 'rails', '3.2.8'

# Other gems to consider
# gem 'cancan'
# gem 'devise'
# gem 'haml-rails'
# gem 'informal'
# gem 'jbuilder'
# gem 'kaminari'
# gem 'simple_form'


# Gems used only for assets and not required
# in production environments by default.
#
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'

  # Other asset pipeline gems to consider
  # gem 'bootstrap-sass'
  # gem 'bourbon'
  # gem 'compass-rails'
end

# Gems that facilitate development but are not required to run the app.
# Note `require: false` for those gems that are purely command-line tools.
#
group :development do
  gem 'capistrano',  require: false
  gem 'letter_opener'
  gem 'rb-fsevent',  require: false
  gem 'guard-rspec', require: false
  gem 'powder',      require: false
  gem 'quiet_assets'
  gem 'ruby_gntp',   require: false
  gem 'vendorer',    require: false

  # Other development gems to consider
  # gem 'brakeman',  require: false
  # gem 'debugger'
  # gem 'rails-erd'
end

# Gems needed for running tests.
# Note that some of these are also used in :development for Rails generators.
#
group :test do
  gem 'factory_girl_rails', group: :development
  gem 'launchy'
  gem 'steak',              group: :development
end

# Gems needed in production environments only.
#
group :production, :staging do
  gem 'simple_postmark'
  gem 'unicorn', require: false
end
