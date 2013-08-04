namespace :seeds do
  desc "Run rake db:seed"
  task :execute, :roles => :db, :only => { :primary => true } do
    run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} db:seed"
  end
  after "deploy:migrate", "seeds:execute"
end
