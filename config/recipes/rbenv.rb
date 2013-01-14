set_default(:ruby_version) { File.read(File.expand_path("../../../.ruby-version", __FILE__)).strip }

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do
    run "#{sudo} aptitude -y update"
    run "#{sudo} aptitude -y install curl git-core"
    run "#{sudo} aptitude -y install build-essential"
    run "#{sudo} aptitude -y install zlib1g-dev libssl-dev"
    run "#{sudo} aptitude -y install libreadline-gplv2-dev"

    install_or_upgrade_rbenv
    bashrc = <<-BASHRC
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
BASHRC
    put bashrc, "/tmp/rbenvrc"
    run "cat /tmp/rbenvrc ~/.bashrc > ~/.bashrc.tmp"
    run "mv ~/.bashrc.tmp ~/.bashrc"
    run %q{export PATH="$HOME/.rbenv/bin:$PATH"}
    run %q{eval "$(rbenv init -)"}
    compile_ruby
  end
  after "deploy:install", "rbenv:install"

  desc "Install the latest version of Ruby"
  task :upgrade, roles: :app do
    install_or_upgrade_rbenv
    compile_ruby
  end
end

def install_or_upgrade_rbenv
  run "curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
end

def compile_ruby
  run "rbenv install #{ruby_version}"
  run "rbenv global #{ruby_version}"
  run "gem install bundler --no-ri --no-rdoc"
  run "rbenv rehash"
end
