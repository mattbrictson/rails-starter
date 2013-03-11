set_default(:ruby_version) { File.read(File.expand_path("../../../.ruby-version", __FILE__)).strip }

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do
    run "#{sudo} aptitude -y update"
    run "#{sudo} aptitude -y install curl git-core"

    install_or_upgrade_rbenv
    modify_bashrc
    bootstrap_ubuntu_for_ruby_compile
    compile_ruby
  end
  after "deploy:install", "rbenv:install"

  desc "Install the latest version of Ruby"
  task :upgrade, roles: :app do
    install_or_upgrade_rbenv
    bootstrap_ubuntu_for_ruby_compile
    compile_ruby
  end

  desc "Check that the specified version of Ruby is properly installed"
  task :check, roles: :app do
    begin
      run("rbenv versions | grep '#{ruby_version}'")
    rescue
      logger.log(Logger::IMPORTANT, "Required Ruby version is not installed: #{ruby_version}")
      logger.log(Logger::IMPORTANT, "Run rbenv:upgrade to install it")
      exit(1)
    end
  end
  before "deploy:update_code", "rbenv:check"
end

def install_or_upgrade_rbenv
  run "curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
end

def modify_bashrc
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
end

def bootstrap_ubuntu_for_ruby_compile
  run "#{sudo} $HOME/.rbenv/plugins/rbenv-bootstrap/bin/rbenv-bootstrap-ubuntu-12-04"
end

def compile_ruby
  run "rbenv install #{ruby_version}"
  run "rbenv global #{ruby_version}"
  run "gem install bundler --no-ri --no-rdoc"
  run "rbenv rehash"
end
