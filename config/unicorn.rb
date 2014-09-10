# config/unicorn.rb
# Set environment to production unless something else is specified
user 'dev', 'dev'

env = ENV["RAILS_ENV"] || "production"

worker_processes ( ENV["WORKERS_COUNT"] || 2 )

# Load rails+github.git into the master before forking workers
# for super-fast worker spawn times
preload_app true

timeout 120

app_dir = '/home/dev/app/format-odin'

working_directory app_dir

tmp_path    = "#{app_dir}/tmp"
listen        "#{tmp_path}/unicorn.socket", :backlog => 2048
pid           "#{tmp_path}/pids/unicorn.pid"
stdout_path   "#{app_dir}/log/unicorn.stdout.log"
stderr_path   "#{app_dir}/log/unicorn.stderr.log"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{tmp_path}/pids/unicorn.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
