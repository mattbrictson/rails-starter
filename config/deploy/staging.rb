set :rails_env, 'staging'
_cset :branch, 'development'

server 'staging.yoursitegoeshere.com',
       :web, :app, :db, :backup, :primary => true
