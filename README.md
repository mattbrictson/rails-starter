# 55minutes/rails-starter

**A simple template for starting new Rails 3.2 projects.**

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
* An easy way to add Twitter Bootstrap, should you choose to do so

More on our blog:

* [Rails OS X Developer Guide – Installing an rbenv-based Rails stack on Mountain Lion][osx-rails]
* [Lightning-Fast Sass Reloading in Rails 3.2][sass-reloading]
* [SMACSS and Rails – A Styleguide for the Asset Pipeline][smacss-rails]


## Getting started

### Install rbenv

We recommend [rbenv][] and [ruby-build][] for managing Ruby installations. This template currently uses Ruby 2.0.0-p353.

1. Install rbenv into `~/.rbenv` using the fantastic [rbenv-installer][] script.
2. Run `rbenv install 2.0.0-p353` (this will take several minutes).
3. Optional: make 2.0.0-p353 your default ruby by running `rbenv global 2.0.0-p353`.

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

**Protip:** Install [rubygems-bundler][] so you won’t need to use `bundle exec` all the time. *Don’t forget to reinstall it whenever you install a new version of Ruby.*

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


## Twitter Bootstrap integration

The easiest way to add Twitter Bootstrap is through [SimpleForm][]. Follow these steps:

1. Uncomment these lines in the Gemfile and run `bundle install`:

        gem 'simple_form'
        gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'

2. Run `rails generate simple_form:install --bootstrap`
3. Edit `app/assets/javascripts/application.js` and add this line after `jquery_ujs`:

        //= require twitter/bootstrap

4. Edit `app/assets/stylesheets/application.css.scss` and add these lines:

        //= require twitter/bootstrap
        //= require twitter/bootstrap-responsive

Twitter Bootstrap’s JavaScripts and CSS will now be available throughout your app. To create forms that use Bootstrap’s styling, use SimpleForm like this:

```
<%= simple_form_for(@article, :html => { :class => 'form-horizontal' }) do |f| %>
  ...
<% end %>
```

**Protip:** [Here are a bunch of great SimpleForm+Bootstrap examples.][bootstrap-examples]

**Protip:** If you plan on using [Devise][], make sure you install SimpleForm first! Then when you install Devise, it will automatically detect SimpleForm and generate its views with `simple_form_for`.


## Using the provided Capistrano 3.x recipes

This project uses the `capistrano-fiftyfive` gem, which provides all recipes needed to set up and deploy on Ubuntu 12.04. It's super simple.

### Purchase a VPS

Using a provider like [DigitalOcean](http://digitalocean.com), purchase an Ubuntu 12.04 LTS virtual private server. **Make sure to install your SSH key for the root user.**

Make note of the IP address of the VPS. Then:

### Change the deployment settings of your project

To use capistrano you will need to update the deployment settings to match your VPS.

1. Review the contents of `config/deploy.rb`. Be sure the change the `:repository` to match your git repository URL.
2. Update the IP address in `config/deploy/staging.rb` to match the IP of the VPS you just purchased.
3. By default, `cap production deploy` will deploy from the `master` branch, and `cap staging deploy` will deploy from the `development` branch. Update the branch settings if you use a different branch policy.

### Capistrano takes care of the rest!

Don't forget to `git push` your code so that capistrano can deploy it. Make sure you've pushed the branch that capistrano is expecting in `staging.rb`. Then run these commands and follow the prompts to install Nginx, SSL, PostgreSQL, Ruby (the whole stack!):

     cap staging provision
     cap staging deploy:migrate_and_restart


**Refer to the [capistrano-fiftyfive README][cap-55] more details and deployment instructions.**


[Postmark]:https://postmarkapp.com
[osx-rails]:http://blog.55minutes.com/2013/09/rails-os-x-install-guide/
[sass-reloading]:http://blog.55minutes.com/2013/01/lightning-fast-sass-reloading-in-rails-32/
[SMACSS]:http://smacss.com
[smacss-rails]:http://blog.55minutes.com/2013/01/smacss-and-rails/
[rbenv]:https://github.com/sstephenson/rbenv
[ruby-build]:https://github.com/sstephenson/ruby-build
[rbenv-installer]:https://github.com/fesplugas/rbenv-installer
[capybara-webkit]:https://github.com/thoughtbot/capybara-webkit
[qt-instructions]:https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
[rubygems-bundler]:https://github.com/mpapis/rubygems-bundler
[tarball]:https://github.com/55minutes/rails-starter/tarball/rails-3-2
[r]:http://blog.55minutes.com/post/15353228566/invoke-rails-and-rake-faster-and-with-fewer-mistakes
[SimpleForm]:https://github.com/plataformatec/simple_form
[bootstrap-examples]:http://simple-form-bootstrap.plataformatec.com.br/articles/new
[Devise]:http://devise.plataformatec.com.br
[cap-55]:https://github.com/55minutes/capistrano-fiftyfive/#readme
