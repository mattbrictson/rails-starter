set_default(:postgresql_host, "localhost")
set_default(:postgresql_user) { application }
set_default(:postgresql_password) { Capistrano::CLI.password_prompt "PostgreSQL Password: " }
set_default(:postgresql_database) { "#{application}_#{rails_env}" }
set_default(:postgresql_backup_path) { "#{shared_path}/backups/postgresql-dump.dmp" }
set_default(:postgresql_pgpass_path) { "#{shared_path}/config/pgpass" }

namespace :postgresql do
  desc "Install the latest stable release of PostgreSQL."
  task :install, roles: :db, only: {primary: true} do
    run "#{sudo} add-apt-repository -y ppa:pitti/postgresql"
    run "#{sudo} aptitude -y update"
    run "#{sudo} aptitude -y install postgresql libpq-dev"
  end
  after "deploy:install", "postgresql:install"

  desc "Create a database for this application."
  task :create_database, roles: :db, only: {primary: true} do
    run %Q{#{sudo} -u postgres psql -c "create user #{postgresql_user} with password '#{postgresql_password}';"}
    run %Q{#{sudo} -u postgres psql -c "create database #{postgresql_database} owner #{postgresql_user};"}
  end
  after "deploy:setup", "postgresql:create_database"

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "postgresql.yml.erb", "#{shared_path}/config/database.yml"
  end
  after "deploy:setup", "postgresql:setup"

  desc "Generate the pgpass configuration file."
  task :setup_pgpass, roles: :app do
    pgpass_dir = File.dirname(postgresql_pgpass_path)
    run "mkdir -p #{pgpass_dir}"
    template "pgpass.erb", postgresql_pgpass_path
    run "chmod 0600 #{postgresql_pgpass_path}"
  end
  after "postgresql:setup", "postgresql:setup_pgpass"

  desc "Generate logrotated configuration for performing backups."
  task :setup_backup, roles: :app do
    run "mkdir -p #{File.dirname(postgresql_backup_path)}"
    template "postgresql-backup-logrotate.erb", "/tmp/pg-backup"

    logrotate_conf = "/etc/logrotate.d/postgresql-backup-#{application}"
    run "#{sudo} cp /tmp/pg-backup #{logrotate_conf}"
    run "#{sudo} chown root:root #{logrotate_conf}"
    run "#{sudo} chmod 644 #{logrotate_conf}"

    run "touch #{postgresql_backup_path}"
  end
  after "postgresql:setup", "postgresql:setup_backup"

  desc "Symlink the database.yml file into latest release"
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "postgresql:symlink"
end
