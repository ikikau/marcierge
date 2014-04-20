

set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/home/webapp/project/marcierge.com'
set :user, 'webapp'
# set :bundle_flags,    "--production --quiet"

server 'marcierge_webapp', :app, :web, :db, primary: true
