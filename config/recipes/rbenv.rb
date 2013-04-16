set_default(:ruby_version) { File.read(File.expand_path("../../../.ruby-version", __FILE__)).strip }

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install do
    run "#{sudo} aptitude -q -q -y update"
    run "#{sudo} aptitude -y install curl git-core"

    install_rbenv
    modify_bashrc
    bootstrap_ubuntu_for_ruby_compile
    compile_ruby
  end
  after "deploy:install", "rbenv:install"

  desc "Set up standard variables for rbenv"
  task :setup do
    write_rbenv_var("RAILS_ENV", rails_env)
  end
  after "deploy:setup", "rbenv:setup"

  desc "Install the latest version of Ruby"
  task :upgrade do
    update_rbenv
    bootstrap_ubuntu_for_ruby_compile
    compile_ruby
  end

  desc "Update just rbenv and its plugins, without compiling Ruby"
  task :update do
    update_rbenv
  end

  desc "Check that the specified version of Ruby is properly installed"
  task :check do
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

def install_rbenv
  run "curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash"
end

def update_rbenv
  run "rbenv update"
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

  # Only replace ~/.bashrc if it doesn't already contain "rbenv init"
  run "grep -qs 'rbenv init' ~/.bashrc || mv ~/.bashrc.tmp ~/.bashrc"

  # Load rbenv into the current shell
  run %q{export PATH="$HOME/.rbenv/bin:$PATH"}
  run %q{eval "$(rbenv init -)"}
end

def bootstrap_ubuntu_for_ruby_compile
  run "#{sudo} $HOME/.rbenv/plugins/rbenv-bootstrap/bin/rbenv-bootstrap-ubuntu-12-04"
end

def compile_ruby
  run "CFLAGS=-O3 rbenv install #{ruby_version}"
  run "rbenv global #{ruby_version}"
  run "gem install bundler --no-ri --no-rdoc"
  run "rbenv rehash"
end

def write_rbenv_var(name, value)
  run "touch ~/.rbenv/vars"
  run "chmod 0600 ~/.rbenv/vars"

  run "sed --in-place '/^#{name}=/d' ~/.rbenv/vars"

  put "#{name}=#{value}\n", "/tmp/rbenv_var"
  run "cat /tmp/rbenv_var >> ~/.rbenv/vars"
  run "rm /tmp/rbenv_var"
end
