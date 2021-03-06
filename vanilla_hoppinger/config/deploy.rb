# config valid only for Capistrano 3.1
lock "3.2.1"

set :application, vanilla_hoppinger
set :repo_url, "git@github.com:hoppinger/mijngs1-portal.git"
set :stages, %w(production acceptance testing)
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :templates_path, "config/deploy/templates"

set :linked_files, %w(config/database.yml config/secrets.yml .env)
set :linked_dirs, %w(bin log tmp/cache tmp/pids tmp/sockets vendor/bundle public/system)
set :rbenv_type, :user
set :rbenv_ruby, "2.2.3"
set :rbenv_path, '/home/deployer/.rbenv'
set :rbenv_map_bins, %w(rake gem bundle ruby rails foreman)

# Initialize ActiveRecord after deploying to speedup first boot
set :foreman_roles, :all
set :foreman_use_sudo, false
set :foreman_template, "upstart"
set :foreman_export_path, ->{ File.join("/home/deployer/", ".init") }

namespace :deploy do
  task :prepare_foreman do
    on roles(:all) do |host|
      execute :sudo, :mv, "/home/deployer/.init/#{fetch(:application)}*", "/etc/init"
    end
  end
end

after "deploy:finishing", "foreman:export"
after "deploy:finishing", "deploy:prepare_foreman"
after "deploy:finished", "foreman:stop"
after "deploy:finished", "foreman:start"
