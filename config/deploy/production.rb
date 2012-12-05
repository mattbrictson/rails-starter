set :rails_env, 'production'
set_default :branch, 'unspecified' # Force use of `-s branch=` to deploy
server 'yoursitegoeshere.com', :web, :app, :db, primary: true
