set :branch, ENV.fetch("CAPISTRANO_BRANCH", "development")

server "staging.yoursitegoeshere.com",
       :user => "deployer",
       :roles => %w(app backup cron db web)
