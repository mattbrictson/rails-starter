# Taken from
#   * http://railscasts.com/episodes/337-capistrano-recipes ,
#   * http://railscasts.com/episodes/373-zero-downtime-deployment ,
# with the following modifications and enhancements:
#
# * modified for Ubuntu 12.04
# * multistage support (staging and production environments)
# * postgresql backup using logrotated
# * ufw setup
# * rbenv:upgrade task (for when you someday change your ruby version)
# * secrets.yml for storing the Rails token and Postmark API key
# * https config for nginx

require "bundler/capistrano"

set :stages, %w(production staging)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

load "config/recipes/base"

load "config/recipes/nginx"
load "config/recipes/nodejs"
load "config/recipes/postgresql"
load "config/recipes/rake"
load "config/recipes/rbenv"
load "config/recipes/secrets"
load "config/recipes/ufw"
load "config/recipes/unicorn"
load "config/recipes/logrotate"

set :user, "deployer"
set :application, "rails-starter"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :maintenance_config_warning, false
set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

set :scm, "git"
set :repository, "git@github.com:mbrictson/#{application}.git"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
# SSH gives zlib errors if you have compression enabled in .ssh/config.
# This setting is a workaround. See also:
# http://groups.google.com/group/capistrano/browse_thread/thread/b3b03973ba210e52?pli=1
ssh_options[:compression] = false

after "deploy", "deploy:cleanup" # keep only the last 5 releases
