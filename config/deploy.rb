require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'
require 'mina-stack'
require 'mina_sidekiq/tasks'

set :app,                 'format1'
set :server_name,         'format1.net'
set :keep_releases,       9999
set :default_server,      :production
set :server, ENV['to'] || default_server
set :user,                'dev'
set :forward_agent,       true
set :deploy_to,           "/home/#{user}/apps/#{app}"
set :repository,          "git@github.com:drachyovmaxim/format-odin.git"
set :sidekiq_log,         "#{deploy_to}/#{current_path}/log/sidekiq.log"
set :sidekiq_pid,         "#{deploy_to}/#{current_path}/tmp/pids/sidekiq.pid"
set :nginx_path,          '/etc/nginx'
invoke :"env:#{server}"

# Allow calling as `mina deploy at=master`
set :branch, ENV['at']  if ENV['at']

set :server_stack,                  %w(
                                      nginx
                                      postgresql
                                      rbenv
                                      puma
                                      imagemagick
                                      memcached
                                      node
                                      bower
                                    )

set :shared_paths,                  %w(
                                      tmp
                                      log
                                      config/puma.rb
                                      config/database.yml
                                      config/application.yml
                                      public/uploads
                                    )

set :monitored,                     %w(
                                      nginx
                                      postgresql
                                      puma
                                      memcached
                                    )

task :environment do
  invoke :'rbenv:load'
end

desc "Deploys the current version to the server."
task :deploy do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'bower:install_assets'
    invoke :'rails:assets_precompile'

    to :launch do
      invoke :'puma:phasedrestart'
    end
  end
end
