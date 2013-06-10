require 'bundler/capistrano'
set :application, "proyect_ispweb"
<<<<<<< HEAD
<<<<<<< HEAD
set :repository,  "git://github.com/asergiop21/ispweb.git" #https://github.com/asergiop21/ispweb.git"
=======
set :repository,  "https://github.com/asergiop21/ispweb.git"
>>>>>>> 0fbfaaa8973398ee9a3ce1bd916334df3609691e
=======
set :repository,  "https://github.com/asergiop21/ispweb.git"
>>>>>>> 0fbfaaa8973398ee9a3ce1bd916334df3609691e
set :deploy_to, '/home/sergio/proyect_ispweb'
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :user, 'sergio'
set :password, 'Ufbnla2013'
set :deploy_via, :remote_cache
set :use_sudo, false
set :branch, 'master'

role :web, 'proyect_ispweb.com'                          # Your HTTP server, Apache/etc
role :app, 'proyect_ispweb.com'                          # This may be the same as your `Web` server
role :db, 'proyect_ispweb.com', :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
namespace :deploy do
    task :start do ; end
    task :stop do ; end
    task :restart, :roles => :app, :except => {:no_release => true } do
      run "#{try_sudo} touch #{File.join(current_path, 'tmp','restart.txt')}" 
end
    #desc "reload the database with seed data"
    task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
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
