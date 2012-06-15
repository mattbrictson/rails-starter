source 'https://rubygems.org'

gem 'bcrypt-ruby', '~> 3.0.0'
# gem 'debugger'
# gem 'jbuilder' # Jbuilder templates for JSON
gem 'jquery-rails'
gem 'pg'
gem 'rails',       '3.2.6'
gem 'thin',        require: false


# Gems used only for assets and not required
# in production environments by default.
#
group :assets do
  gem 'compass-rails','~> 1.0.0.rc.2'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby
end

# Gems that facilitate development but are not required to run the app.
# Note `require: false` for those gems that are purely command-line tools.
#
group :development do
  gem 'capistrano',  require: false
  gem 'rb-fsevent',  require: false
  gem 'guard-rspec', require: false
  gem 'ruby_gntp',   require: false
end

# Gems needed for running tests.
# Note that some of these are also used in :development for Rails generators.
#
group :test do
  gem 'factory_girl_rails', group: :development
  gem 'launchy'
  gem 'steak',              group: :development
end
