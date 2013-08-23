set :rails_env, 'production'
_cset :branch, 'master'

server 'yoursitegoeshere.com',
       :web, :app, :db, :backup, :primary => true
