# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'growhaus_stats'
set :repo_url, 'git@github.com:rubyforgood/growhaus_stats.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, fetch(:linked_files, []).push('config/application.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Clear existing task so we can replace it rather than "add" to it.
Rake::Task['deploy:compile_assets'].clear 

namespace :deploy do
  desc 'Compile assets'
  task :compile_assets => [:set_rails_env] do
    # invoke 'deploy:assets:precompile'
    invoke 'deploy:assets:precompile_local'
    invoke 'deploy:assets:backup_manifest'
  end

  namespace :assets do
    desc 'Precompile assets locally and then rsync to web servers' 
    task :precompile_local do 
      # compile assets locally
      run_locally do
        execute "RAILS_ENV=#{fetch(:rails_env)} bundle exec rake assets:precompile"
      end

      # rsync to each server
      local_dir = './public/assets/'
      on roles( fetch(:assets_roles, [:web]) ) do
        # this needs to be done outside run_locally in order for host to exist
        remote_dir = "#{host.user}@#{host.hostname}:#{release_path}/public/assets/"

        run_locally { execute "rsync -av --delete #{local_dir} #{remote_dir}" }
      end

      # clean up
      run_locally { execute "rm -rf #{local_dir}" }
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      execute "cd #{current_path} && bundle exec pumactl restart"
    end
  end
end

after :deploy, 'deploy:restart'
