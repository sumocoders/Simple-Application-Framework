load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :application, "xxx.sumoapp.be"
set :user, "sumodev"
set :repository, "git@github.com:sumocoders/xxx.git"				
set :document_root, "/home/#{user}/xxx.sumoapp.be"

set :deploy_to, "/home/#{user}/apps/#{application}"
server "web01.crsolutions.be", :app, :web, :db, :primary => true
set :scm, :git
set :copy_strategy, :checkout
set :branch, "master"
set :use_sudo, false
set :group_writable, false
set :keep_releases, 3
set :deploy_via, :remote_cache
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

begin
	# Deployment process
	namespace :deploy do
		desc 'Prepares the servers for deployment.'
		task :setup, :except => { :no_release => true } do
			# this method is overwritten because our application isn't a Rails-application

			# define folders to create
			dirs = [deploy_to, releases_path, shared_path]
			
			# add folder that aren't standard
			dirs += shared_children.map { |d| File.join(shared_path, d) }

			# create the dirs
			run %{
				#{try_sudo} mkdir -p #{dirs.join(' ')} && 
				#{try_sudo} chmod g+w #{dirs.join(' ')}
			}
		end

		task :finalize_update, :except => { :no_release => true } do
			# our application isn't a Rails-application so don't do Rails specific stuff
			run 'chmod -R g+w #{latest_release}' if fetch(:group_writable, true)
		end

		# overrule restart	
		task :restart do; end
	end

	# define some extra folder to create
	set :shared_children, %w(config/cache config/library files)

	# custom events configuration
	after 'deploy:setup' do
		# create symlink for document_root if it doesn't exists
		documentRootExists = capture("if [ ! -e #{document_root} ]; then ln -sf #{current_path}/default_www #{document_root}; echo 'no'; fi").chomp

		unless documentRootExists == 'no'
			warn 'Warning: Document root (#{document_root}) already exists'
			warn 'to link it to the Fork deploy issue the following command:'
			warn '	ln -sf #{current_path}/default_www #{document_root}'
		end 
	end

	after 'deploy:update_code' do
		# create config files
		path_library = <<-CONFIG
<?php
	// custom constant used by the init classes
	define('INIT_PATH_LIBRARY', '#{current_path}/library');
?>
		CONFIG

		# upload the files
		put path_library, "#{shared_path}/config/cache/config.php"

		# change the path to current_path
		run "if [ -f #{shared_path}/config/library/globals.php ]; then sed -i 's/#{version_dir}\\/[0-9]*/#{current_dir}/' #{shared_path}/config/library/globals.php; fi"

		# create dirs
		run %{
			mkdir -p #{release_path}/default_www/cache/config
		}

		# symlink the globals
		run %{
			ln -sf #{shared_path}/config/library/globals.php #{release_path}/library/globals.php &&
			ln -sf #{shared_path}/config/cache/config.php #{release_path}/default_www/cache/config/config.php 
		}
		
		folders = capture("ls -1 #{release_path}/default_www/files").split(/\r?\n/)

		# loop the folders
		folders.each do |folder|
			# copy them to the shared path, remove them from the release and symlink them
			run %{
				mkdir -p #{shared_path}/files/#{folder} &&
				cp -r #{release_path}/default_www/files/#{folder} #{shared_path}/files/ &&
				rm -rf #{release_path}/default_www/files/#{folder} &&
				ln -s #{shared_path}/files/#{folder} #{release_path}/default_www/files/#{folder}
			}
		end
	end

rescue LoadError
	$stderr.puts <<-INSTALL
You need the forkcms_deploy gem (which simplifies this Capfile) to deploy this application
Install the gem like this:
	gem install forkcms_deploy
				INSTALL
	exit 1
end