require 'pry'
require 'rvm/capistrano'
require "bundler/capistrano"
require "capistrano/ext/multistage"
require 'capistrano/switchuser'
require 'capistrano-unicorn'


set :application, 'marcierge'
set :deploy_via, :remote_cache
set :repository,  'git@github.com:creasty/marcierge.git'
set :rvm_ruby_string, '1.9.3@marcierge'
set :rvm_type, :system
set :rvm_path, '~/.rvm/'
set :use_sudo, false
set :scm, :git
set :keep_releases, 4

set :deploy_to, '~/project/marcierge.com/'



set :rvm_type, :user
set :normalize_asset_timestamps, false

set :rake, lambda { "#{fetch(:bundle_cmd, "bundle")} exec rake" }


set :bundle_without,  [:development]


namespace :deploy do
  task :symlink_contents do
    run "ln -nfs #{deploy_to}/shared/pids #{release_path}/tmp/pids"
    run "ln -nfs #{deploy_to}/shared/pids #{release_path}/tmp/pids"
    run "ln -nfs #{deploy_to}/shared/sockets #{release_path}/tmp/sockets"
    run "ln -nfs #{deploy_to}/shared/system #{release_path}/public/system"

    # %w[.htaccess].each do |name|
    #   run "ln -nfs #{deploy_to}/htdocs/#{name} #{release_path}/public/#{name}"
    # end
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake unicorn:restart"
    # run "touch #{current_release}/tmp/restart.txt"
  end
end

namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_release} && RAILS_ENV=#{rails_env} bundle install"
  end

end

after 'bundle:install', 'deploy:migrate'
after 'deploy:create_symlink', 'deploy:symlink_contents'
# after 'deploy:restart', 'unicorn:reload'    # app IS NOT preloaded
# after 'deploy:restart', 'unicorn:restart'   # app preloaded
# after 'deploy:restart', 'unicorn:duplicate' # before_fork hook implemented (zero downtime deployments)
after 'deploy', 'deploy:cleanup'