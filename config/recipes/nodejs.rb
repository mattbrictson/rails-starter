namespace :nodejs do
  desc "Install the latest relase of Node.js"
  task :install, roles: :app do
    run "#{sudo} add-apt-repository -y ppa:chris-lea/node.js"
    run "#{sudo} aptitude -q -q -y update"
    run "#{sudo} aptitude -y install nodejs"
  end
  after "deploy:install", "nodejs:install"
end
