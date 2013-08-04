#!/bin/bash
#
# Script used to test this project in Jenkins. Assumes the Jenkins user is
# using bash and rbenv. YMMV.
#
set -e

# Initialize rbenv
source ~/.bashrc

# Ensure we are in the project directory
cd $WORKSPACE

# If ruby version is not installed, install it
if ! ruby -v &> /dev/null; then
  rbenv update
  rbenv install `cat .ruby-version`
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
fi

# Set up local config (don't overwrite database.yml in case it's customized)
cp -n config/database.example.yml config/database.yml || true
cp config/secrets.example.yml config/secrets.yml

bundle install
bundle exec rake db:create db:migrate
bundle exec rake db:seed

# Webkit needs an X server in order to render.
# See https://github.com/thoughtbot/capybara-webkit/issues/402
if type xvfb-run; then
  DISPLAY=localhost:1.0 xvfb-run bundle exec rake
else
  bundle exec rake
fi

if bundle show brakeman &> /dev/null; then
  bundle exec brakeman
fi

if bundle show license_finder &> /dev/null; then
  bundle exec license_finder
fi
