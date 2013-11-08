set :branch, ENV.fetch("CAPISTRANO_BRANCH", "master")

server "yoursitegoeshere.com",
       :user => "deployer",
       :roles => %w(app backup cron db web)
