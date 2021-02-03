require 'bundler/capistrano'
load 'deploy/assets'

# =============================================================================
# GENERAL SETTINGS
# =============================================================================

role :web, "rooms.lsa.umich.edu"
role :app, "rooms.lsa.umich.edu"
role :db,  "rooms.lsa.umich.edu", :primary => true
set :application,  "iris"
set :deploy_to,  "/var/www/html/#{application}/"
set :deploy_via, :remote_cache
set :scm, :git
#set :repository, "git@bitbucket.org:mclassrooms/iris.git"
# set :repository, "git@github.com:dschmura/IRIS.git"
# set :repository, "https://github.com/lsa-mis/IRIS"
set :repository, "git@github.com:lsa-mis/IRIS.git"
set :branch, ENV['BRANCH'] if ENV['BRANCH']
set :git_enable_submodules, 1
set :scm_verbose, true
set :use_sudo, false
set :user, "deployer"
set :ssh_options, { :forward_agent => true }
set :keep_releases, 5
default_run_options[:pty] = true

# =============================================================================
# RECIPE INCLUDES
# =============================================================================

set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :rake, "#{release_path}/bin/rake"

namespace :deploy do

  %w[start stop restart].each do |command|
    desc "#{command} unicorn"
    task command, roles: :app do
      run "#{sudo} -i /etc/init.d/unicorn-#{application} #{command}"
    end
  end

  #namespace :assets do
  #  task :precompile, :roles => :web, :except => { :no_release => true } do
  #    # from = source.next_revision(current_revision)
  #    # if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
  #       run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
  #    # else
  #    #  logger.info "Skipping asset pre-compilation because there were no asset changes"
  #    # end
  #  end
  #end

   #This step seems to fail often.  I think it is failing on getting to the current path.
#   namespace :seed do
#     run "cd #{current_path}; rake db:migrate RAILS_ENV=production"
#   end

  # Link in database config
  after "deploy:update_code", :link_production_db
  after "deploy:update_code", "deploy:migrate"
  after "deploy:link_production_db", :link_production_db_config
  after "deploy:create_symlink", :fix_file_permissions
  after "deploy:setup", :setup_fix_file_permissions
  after "deploy", "deploy:cleanup"

end

task :link_production_db do
  run "ln -nfs #{deploy_to}/shared/production.sqlite3 #{release_path}/db/production.sqlite3"
end

task :link_production_db_config do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end


# Run at the end of deployment
task :fix_file_permissions, :roles => [ :app, :db, :web ] do
  run "chmod -R g-w #{release_path}"
  run "chmod g+w #{release_path}/db #{release_path}/db/*.sqlite3"
  run "chmod -R g+w #{release_path}/tmp"
  # run "sudo -i chmod -R 775 #{release_path}/public/system/"
  # run "sudo -i chown -R unicorn #{release_path}/tmp;"
end

# Run after the end of "cap deploy:setup"
task :setup_fix_file_permissions, :roles => [ :app, :db, :web ] do
  run "chmod g-w #{deploy_to} #{deploy_to}/releases #{deploy_to}/shared"
end