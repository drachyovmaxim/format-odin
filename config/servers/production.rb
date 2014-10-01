namespace :env do
  task :production => [:environment] do
    set :domain,              '178.62.11.65'
    set :deploy_server,       'production'                   # just a handy name of the server
    set :rails_env,           'production'
    set :branch,              'master'
    invoke :defaults                                         # load rest of the config
  end
end