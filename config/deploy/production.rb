

set :default_shell, :bash
set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/home/webapp/project/marcierge.com/'
set :user, 'webapp'

server 'marcierge_webapp', :app, :web, :db, primary: true
