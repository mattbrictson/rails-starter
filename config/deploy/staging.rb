set :rails_env, 'staging'
set_default :branch, 'master'
server 'staging.yoursitegoeshere.com', :web, :app, :db, primary: true
