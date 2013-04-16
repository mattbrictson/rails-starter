namespace :ufw do
  desc "Install the latest ufw package"
  task :install, roles: :web do
    run "#{sudo} aptitude -q -q -y update"
    run "#{sudo} aptitude -y install ufw"
  end
  after "deploy:install", "ufw:install"

  desc "Setup ufw firewall rules"
  task :setup, roles: :web do
    stop
    run "#{sudo} ufw default deny"
    %w(ssh http https).each { |svc| run "#{sudo} ufw allow #{svc}" }
    start
  end
  after "deploy:setup", "ufw:setup"

  desc "Start ufw"
  task :start, roles: :web do
    run "yes | #{sudo} ufw enable"
  end

  desc "Stop ufw"
  task :stop, roles: :web do
    run "#{sudo} ufw disable"
  end
end
