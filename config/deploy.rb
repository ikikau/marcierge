# require 'pry'
# require "bundler/capistrano"
require "capistrano/ext/multistage"
require 'capistrano/switchuser'
# require "rvm/capistrano"
# require 'whenever/capistrano'


set :application, 'marcierge'
set :repository,  'git@github.com:creasty/marcierge.git'

set :scm, :git

set :deploy_to, '~/project/marcierge.com/'
set :use_sudo, false

set :rvm_ruby_string, '1.9.3@marcierge'
set :rvm_type, :user
set :normalize_asset_timestamps, false


namespace :deploy do
  # task :symlink_contents do
  #   %w[.htaccess].each do |name|
  #     run "ln -nfs #{deploy_to}/htdocs/#{name} #{release_path}/public/#{name}"
  #   end
  # end

  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_release}/tmp/restart.txt"
  end
end



after 'deploy', 'deploy:migrate'
after 'deploy', 'deploy:cleanup'
# after 'deploy:create_symlink', 'deploy:symlink_contents'