# Goals of this repository

* For each version of Rails (or at least, the versions I care about), I will regenerate the project using `rails new -d postgresql`, then commit and tag the result under the name `rails-new-v[VERSION]`. This gives me a nice history of what has changed out of the box with each Rails release, which I can then cherry-pick when I wish to upgrade existing apps. These pristine `rails new` results will always be done in the `rails-new` branch of this repository.
* I will further enhance the standard output of `rails new` by trying to incorporate the "best practices of the moment" for [SMACSS](http://smacss.com/), `rbenv`, `bundler`, testing, and deployment to Ubuntu 12.04 via Capistrano. In other words, create a good foundation to be used for quickly starting new Rails projects. These enhancements will be done in `master`.

# Starting a new rails project from this foundation

## rbenv

Here's how I set up my Ruby environment with `rbenv` and `ruby-build`:

1. Install `rbenv` into `~/.rbenv` using [the rbenv-installer script][rbenv-installer].
2. Install [rbenv-binstubs][] so you won't need to use `bundle exec` all the time.
3. Run `rbenv install 1.9.3-p392`; this will take several minutes.
4. Optional: make 1.9.3-p392 your default ruby by running `rbenv global 1.9.3-p392`.

## Rails

1. Download and extract [the tarball of this repository][tarball]; this will be the start of your new Rails project.
1. Globally replace `rails-starter` and `RailsStarter` with the desired name of your project.
1. `cd` into the project and run `git init && git add . && git commit -m "init"` to initialize a git repository.
2. Install bundler: `gem install bundler`
3. Run `rbenv rehash`.
4. Run `bundle install`
5. Once more, run `rbenv rehash`.
6. Consider installing [this handy bash script][r].
7. Run `cp config/secrets.example.yml config/secrets.yml` to make a local version of the secret settings.
7. Run `rake secret` and use the resulting value to replace the one in `config/secrets.yml`.
8. Run `cp config/database.example.yml config/database.yml` to make a local version of the database config.
8. Run `rake db:create` to initialize the database (make sure postgres is started first).
9. Run `rake db:migrate`.
10. Commit the generated schema: `git add db && git commit -m "Create schema with db:migrate"`
10. Run `rake spec` to make sure everything works.
11. Run `rails s` to start the app.

## Capistrano

Several Capistrano recipes are provided out of the box, mostly taken from [RailsCasts #337][cast337] and [RailsCasts #373][cast373]. These recipes assume you will deploy to Ubuntu 12.04 using nginx, unicorn, postgresql, and rbenv. To use them, first make the following edits:

1. Edit the `:repository` in `config/deploy.rb` to point to your own repository.
2. Change the hostnames in `config/deploy/{production,staging}.rb` to match your servers.
3. If you use a special branch naming scheme in your git workflow, you may also want to change the default `:branch` settings in `config/deploy/{production,staging}.rb`. The default is to deploy production from `master` and staging from `development`.
4. This starter assumes your app will enforce HTTPS at all times. Ensure you have your SSL certificate and private key installed on your server in `/etc/ssl`. See `config/recipes/templates/nginx_unicorn.erb` the file names that are expected.
4. Review all files in `config/recipes` and `config/recipes/templates` to understand exactly what files and packages will be installed on your servers! Most likely there at least one or two practices that you will disagree with.

Now to deploy to a brand new staging environment, these steps should work:

1. Provision an Ubuntu 12.04 VM at your hosting provider of choice.
1. SSH into that VM as root and run `aptitude update && aptitude safe-upgrade`
2. Create the admin group: `groupadd admin`
3. Create a deployer user in that group: `adduser deployer --ingroup admin`
4. Optional: use [`ssh-copy-id`][ssh-copy] to install your SSH key for the deployer user (`brew install ssh-copy-id` on the Mac).
5. Generate or install the appropriate SSL certificate and key files for your site in `/etc/ssl`.
6. Now, from your Rails project on your local machine, fire off these commands. These will install various packages, compile Ruby, set up the database, and deploy your app on the staging server (double check the host in `config/deploy/staging.rb` is correct).

        cap deploy:install
        cap deploy:setup
        cap deploy:cold


## Thanks to…

* Jim Myhberg for [his helpful rbenv/bundler blog post][jim].
* Ryan Bates for [nifty_config][nifty], which inspired the `secrets.yml` system used by this project; and for the [Capistrano Recipes (#337)][cast337] and [Zero-Downtime Deployment (#373)][cast373] episodes of RailsCasts, the source code of which I have used almost verbatim.

[rbenv-installer]:https://github.com/fesplugas/rbenv-installer
[rbenv-binstubs]:https://github.com/ianheggie/rbenv-binstubs
[ruby-build-install]:https://github.com/sstephenson/ruby-build#readme
[rbenv-bundler-install]:https://github.com/carsomyr/rbenv-bundler#readme
[tarball]:https://github.com/mbrictson/rails-starter/tarball/master
[r]:http://blog.55minutes.com/post/15353228566/invoke-rails-and-rake-faster-and-with-fewer-mistakes
[jim]:http://jimeh.me/blog/2011/11/01/my-ruby-development-environment/
[nifty]:https://github.com/ryanb/nifty-generators/blob/master/rails_generators/nifty_config/USAGE
[cast337]:http://railscasts.com/episodes/337-capistrano-recipes
[cast373]:http://railscasts.com/episodes/373-zero-downtime-deployment
[ssh-copy]:http://linux.die.net/man/1/ssh-copy-id
