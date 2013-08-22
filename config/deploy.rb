require "bundler/capistrano"

set :stages, %w(production staging)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

# capistrano-fiftyfive recipes and config
# See: https://github.com/55minutes/capistrano-fiftyfive/
require "capistrano/fiftyfive"
Capistrano::Fiftyfive.load(:except => [:cron, :delayed_job], :autorun => true)
set :project_root, File.expand_path("../..", __FILE__)

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
