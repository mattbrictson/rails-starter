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
  rbenv install `cat .ruby-version`
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
fi

# Set up local config (don't overwrite database.yml in case it's customized)
cp -n config/database.example.yml config/database.yml || true
cp config/secrets.example.yml config/secrets.yml

bundle install
bundle exec rake db:migrate
bundle exec rake spec

if bundle show brakeman &> /dev/null; then
  bundle exec brakeman
fi
