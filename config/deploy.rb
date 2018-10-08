# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "rent"
set :repo_url, "git@github.com:Arshev/rent.git"

# Default branch is :master
# set :branch, 'TableToDiv'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/rent"
set :deploy_user, 'deployer'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml.key", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "node_modules", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", ".bundle", "shared/bundle", "shared/bin"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

#Была ошибка PassengerInstanceRegistryDir option, Nginx's, это помогло
set :passenger_restart_with_touch, true
#Для Whenever устанавливает параметры для неймспейса в файле крона в зависимости от названия и рабочей среды приложения
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
    namespace :assets do
      task :install_webpack do
        on roles(:app) do
          within release_path do
            with rails_env: fetch(:production) do
              execute :yarn, "install"
              execute :npm, "install"
              execute :rails , "webpacker:verify_install"
              execute :rails , "app:update:bin"
            end
          end
        end
      end
  
      before :precompile, 'assets:install_webpack'
    end
  end

# before "deploy:assets:precompile", "deploy:yarn_install"

# namespace :deploy do
#   desc 'Run rake yarn:install'
#   task :yarn_install do
#     on roles(:web) do
#       within release_path do
#         execute("cd #{release_path} && yarn install")
#         execute("cd #{release_path} && npm install")
#       end
#     end
#   end
# end

# namespace :deploy do
#     namespace :assets do
#       task :install_webpack do
#         on roles(:web) do
#           within release_path do
#             with rails_env: fetch(:production) do
#               execute :yarn, "install"
#               execute :rake , "webpacker:binstubs"
#             end
#           end
#         end
#       end
  
#       before :precompile, 'assets:install_webpack'
#     end
#   end
