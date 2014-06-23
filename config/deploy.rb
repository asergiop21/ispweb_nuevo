require 'bundler/capistrano'

role :web
role :app
role :db
#role :db,  "your slave db-server here"
set :application, "ispweb.com.ar"
set :repository,  "https://github.com/asergiop21/ispweb.git"
set :deploy_to, '/opt/isp/'
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
server "192.168.100.2", :web, :app, :db, primary: true
set :user, 'server'
#set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master'

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#after "deploy:symlink", "deploy:update_crontab"

namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => {:no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path, 'tmp','restart.txt')}" 
end
    desc "reload the database with seed data"
    task :seed do
      run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
      #run "cd #{deploy_to}/current && bundle install vendor/gems"
end
   desc "Update the crontab file"
   task :update_crontab, :roles=> :db do
  run "cd #{release_path} && whenever --update-crontab #{application}"
end


end


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
