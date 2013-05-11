set_default(:rails_log_glob) { "#{shared_path}/log/*" }

namespace :logrotate do
  desc "Configure logrotate for Rails logs"
  task :setup do
    tmp_file = "/tmp/logrotate"
    template "logrotate.erb", tmp_file

    logrotate_conf = "/etc/logrotate.d/#{application}-logs"
    run "#{sudo} cp #{tmp_file} #{logrotate_conf}"
    run "#{sudo} chown root:root #{logrotate_conf}"
    run "#{sudo} chmod 644 #{logrotate_conf}"
  end
  after "deploy:setup", "logrotate:setup"
end
