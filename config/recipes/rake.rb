namespace :rake_task do
  desc "Execute rake COMMAND on the server"
  task :invoke, roles: :app do
    raise "USAGE: cap rake_task:invoke COMMAND='db:migrate'" if ENV['COMMAND'].nil?

    run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{ENV['COMMAND']}"
  end
end
