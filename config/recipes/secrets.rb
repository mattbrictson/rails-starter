namespace :secrets do
  desc "Generate the secrets.yml configuration file."
  task :setup, roles: :app do
    secrets = {}

    %w(rails_secret_token postmark_api_key).each do |k|
      value = Capistrano::CLI.password_prompt "#{rails_env.capitalize} #{k}: "
      secrets[k] = value
    end

    run "mkdir -p #{shared_path}/config"

    put({ rails_env => secrets }.to_yaml, "#{shared_path}/config/secrets.yml")
    run "chmod 600 #{shared_path}/config/secrets.yml"
  end
  after "deploy:setup", "secrets:setup"

  desc "Symlink the secrets.yml file into latest release"
  task :symlink, roles: :app do
    run "rm -f #{release_path}/config/secrets.yml"
    run "ln -nfs #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
  end
  after "deploy:finalize_update", "secrets:symlink"
end
