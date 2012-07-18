# Goals of this repository

* For each version of Rails (or at least, the versions I care about), I will regenerate the project using `rails new -d postgresql`, then commit and tag the result under the name `rails-new-v[VERSION]`. This gives me a nice history of what has changed out of the box with each Rails release, which I can then cherry-pick when I wish to upgrade existing apps. These pristine `rails new` results will always be done in the `rails-new` branch of this repository.
* I will further enhance the standard output of `rails new` by trying to incorporate the "best practices of the moment" for `rbenv`, `bundler` and testing. In other words, create a good foundation to be used for quickly starting new Rails projects. These enhancements will be done in `master`.

# Starting a new rails project from this foundation

## rbenv

Here's how I set up my Ruby environment with `rbenv` and `ruby-build`:

1. Install `rbenv` into `~/.rbenv` by following [these instructions][rbenv-install].
2. [Install `ruby-build`][ruby-build-install].
3. Run `rbenv install 1.9.3-p194`; this will take several minutes.
4. Optional: make 1.9.3-p194 your default ruby by running `rbenv global 1.9.3-p194`.
5. [Install `rbenv-bundler`][rbenv-bundler-install].

## Rails

1. Download and extract [the tarball of this repository][tarball]; this will be the start of your new Rails project.
2. `cd` into the project and install bundler: `gem install bundler`
3. Run `rbenv rehash`.
4. Run `bundle install --path .bundle/bundle`
5. Once more, run `rbenv rehash`.
6. Consider installing [this handy bash script][r].
7. Globally replace `rails-starter` and `RailsStarter` with the desired name of your project.
7. Run `rake secret` and use the resulting value to replace the one in `config/initializers/secret_token.rb`.
8. Run `cp config/database.example.yml config/database.yml` to make a local version of the database config.
8. Run `rake db:create` to initialize the database (make sure postgres is started first).
9. Run `rake db:migrate`.
10. Run `rake spec` to make sure everything works.
11. Run `rails s` to start the app.

## Thanks to…

* Jim Myhberg for [his helpful rbenv/bundler blog post][jim].

[rbenv-install]:https://github.com/sstephenson/rbenv#section_2
[ruby-build-install]:https://github.com/sstephenson/ruby-build#readme
[rbenv-bundler-install]:https://github.com/carsomyr/rbenv-bundler#readme
[tarball]:https://github.com/mbrictson/rails-starter/tarball/master
[r]:http://blog.55minutes.com/post/15353228566/invoke-rails-and-rake-faster-and-with-fewer-mistakes
[jim]:http://jimeh.me/blog/2011/11/01/my-ruby-development-environment/
