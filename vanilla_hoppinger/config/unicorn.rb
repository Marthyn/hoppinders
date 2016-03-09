# config/unicorn.rb
# At hoppinger we deploy to `/var/www/$FQDN`, first find the fqdn.
fqdn = File.expand_path(File.dirname(File.dirname(__FILE__))).split('/')[3]
deploy_path = "/var/www/#{fqdn}"
shared_path = "#{deploy_path}/shared"

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 30
preload_app true
listen "#{shared_path}/tmp/sockets/unicorn.socket"
pid "#{shared_path}/tmp/pids/unicorn.pid"

working_directory "#{deploy_path}/current"
user 'deployer', 'deploy'
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
