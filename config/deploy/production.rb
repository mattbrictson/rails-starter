set :rails_env, 'production'
set_default :branch, 'master'
server 'yoursitegoeshere.com', :web, :app, :db, primary: true
