set :rails_env, 'staging'
set_default :branch, 'development'
server 'staging.yoursitegoeshere.com', :web, :app, :db, primary: true
