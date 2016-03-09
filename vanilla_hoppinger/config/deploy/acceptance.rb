# config/deploy/acceptance.rb
set :rails_env, "acceptance"
set :deploy_to, "/var/www/"
set :nginx_server_name, vanilla_hoppinger
set :nginx_use_basicauth, true
set :nginx_basicauth_location, "/var/www/_htpasswd/#{fetch(:application)}.htpasswd"
set :rbenv_path, '/home/deployer/.rbenv'

set :foreman_options, ->{ {
  app: fetch(:application),
  log: File.join(shared_path, "log"),
  env: File.join(shared_path, ".env"),
  user: 'deployer',
  procfile: File.join(current_path, "Procfile.acceptance")
}}

server "shire.nodes.hoppinger.com", user: "deployer", roles: %w(web app db), primary: true
