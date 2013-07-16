# 55minutes/rails-starter

**A simple template for starting new Rails projects.**

This template targets the following server stack:

* Ubuntu 12.04 LTS
* PostgreSQL
* Unicorn
* Nginx
* rbenv
* [Postmark][] for mail delivery

By using this template, you’ll hit the ground running with best practices for productive Rails and front-end development:

* RSpec and Capybara for testing
* guard-livereload for fast, iterative front-end development
* Up-to-date rbenv and bundler gem management techniques
* [SMACSS][] for organizing stylesheets
* Capistrano recipes to make deployment easy
* `secrets.yml` for storing encryption keys and secret tokens safely outside of source control

More on our blog:

* [Lightning-Fast Sass Reloading in Rails 3.2][sass-reloading]
* [SMACSS and Rails – A Styleguide for the Asset Pipeline](smacss-rails)


## Getting started

### Install rbenv

We recommend [rbenv][] and [ruby-build][] for managing Ruby installations. This template currently uses Ruby 2.0.0-p247.

1. Install rbenv into `~/.rbenv` using the fantastic [rbenv-installer][] script.
2. Run `rbenv install 2.0.0-p247` (this will take several minutes).
3. Optional: make 2.0.0-p247 your default ruby by running `rbenv global 2.0.0-p247`.

### Install Qt

This starter uses the [capybara-webkit][] gem, which requires the Qt libraries (version 4.8 or higher). These libraries aren't installed out of the box on most systems, including Mac OS X.

To install the Qt libraries, [follow these instructions][qt-instructions]. Homebrew is the easiest option on the Mac.

### Create a Rails project from the template

1. Download and extract the [tarball of the 55minutes/rails-starter repository][tarball]; this will be the start of your new Rails project.
2. Globally replace `rails-starter` and `RailsStarter` with the desired name of your project.
3. `cd` into the project and run `git init && git add . && git commit -m "init"` to initialize a git repository.

### Bundle the required gems

1. Install bundler: `gem install bundler`
2. Run `rbenv rehash`.
4. Run `bundle install`
5. Once more, run `rbenv rehash`.

**Protip:** Install [rubygems-bundler][] so you won’t need to use `bundle exec` all the time. *Don’t forgot to reinstall it whenever you install a new version of Ruby.*

### Set up your local configuration

1. Run `cp config/secrets.example.yml config/secrets.yml` to make a local version of the secret settings.
2. Run `cp config/database.example.yml config/database.yml` to make a local version of the database config.

### Create the database

1. Run `rake db:create` to initialize the database (make sure postgres is started first).
2. Run `rake db:migrate`.
3. Commit the generated schema: `git add db && git commit -m "Create schema with db:migrate"`

### Run it!

1. Run `rake spec` to make sure everything works.
2. Run `rails s` to start the app.

**Protip:** Install [this handy bash script][r] to consolidate `rails` and `rake` into a single `r` shortcut.


## Using the provided Capistrano recipes

Several Capistrano recipes are provided out of the box, mostly taken from [RailsCasts #337][cast337] and [RailsCasts #373][cast373]. These recipes assume you will deploy to Ubuntu 12.04 using Nginx, Unicorn, PostgreSQL, rbenv, and Postmark.

### Configure the recipes for your project

To use the recipes, first make the following edits:

1. Edit the `:repository` in `config/deploy.rb` to point to your own repository.
2. Change the hostnames in `config/deploy/{production,staging}.rb` to match your servers.
3. If you use a special branch naming scheme in your git workflow, you may also want to change the default `:branch` settings in `config/deploy/{production,staging}.rb`. The default is to deploy production from `master` and staging from `development`.
4. This template assumes your app will enforce HTTPS at all times. Ensure you have your SSL certificate and private key installed on your server in `/etc/ssl`. See `config/recipes/templates/nginx_unicorn.erb` for the file names that are expected.
5. Review all files in `config/recipes` and `config/recipes/templates` to understand exactly what files and packages will be installed on your servers! Most likely there at least one or two practices that you will disagree with.


### Provision and deploy to a new server

Now to deploy to a brand new staging environment, these steps should work:

1. Provision an Ubuntu 12.04 VPS at your hosting provider of choice.
2. SSH into that VPS as root and run `aptitude update && aptitude safe-upgrade`
3. Create the admin group: `groupadd admin`
4. Create a deployer user in that group: `adduser deployer --ingroup admin`
6. Generate or install the appropriate SSL certificate and key files for your site in `/etc/ssl`.
7. Now, from your Rails project on your local machine, fire off these commands. These will install various packages, compile Ruby, set up the database, and deploy your app on the staging server (double check the host in `config/deploy/staging.rb` is correct).

        cap deploy:install
        cap deploy:setup
        cap deploy:cold

**Protip:** Use [`ssh-copy-id`][ssh-copy] to install your SSH key for the deployer user (`brew install ssh-copy-id` on the Mac).

## Thanks to…

* Jim Myhberg for [his helpful rbenv/bundler blog post][jim].
* Ryan Bates for [nifty_config][nifty], which inspired the `secrets.yml` system used by this project; and for the [Capistrano Recipes (#337)][cast337] and [Zero-Downtime Deployment (#373)][cast373] episodes of RailsCasts, the source code of which I have used almost verbatim.

[Postmark]:https://postmarkapp.com
[sass-reloading]:http://blog.55minutes.com/2013/01/lightning-fast-sass-reloading-in-rails-32/
[SMACSS]:http://smacss.com
[smacss-rails]:http://blog.55minutes.com/2013/01/smacss-and-rails/
[rbenv]:https://github.com/sstephenson/rbenv
[ruby-build]:https://github.com/sstephenson/ruby-build
[rbenv-installer]:https://github.com/fesplugas/rbenv-installer
[capybara-webkit]:https://github.com/thoughtbot/capybara-webkit
[qt-instructions]:https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
[rubygems-bundler]:https://github.com/mpapis/rubygems-bundler
[tarball]:https://github.com/55minutes/rails-starter/tarball/master
[r]:http://blog.55minutes.com/post/15353228566/invoke-rails-and-rake-faster-and-with-fewer-mistakes
[jim]:http://jimeh.me/blog/2011/11/01/my-ruby-development-environment/
[nifty]:https://github.com/ryanb/nifty-generators/blob/master/rails_generators/nifty_config/USAGE
[cast337]:http://railscasts.com/episodes/337-capistrano-recipes
[cast373]:http://railscasts.com/episodes/373-zero-downtime-deployment
[ssh-copy]:http://linux.die.net/man/1/ssh-copy-id
