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

	namespace :forkcms do
		task :link_configs do; end
		task :link_files do; end
	end

	namespace :sumodev do
		namespace :files do
			task :get do
				path = find_folder_in_parents('files')
        		if !path
          			abort "No files folder found in this or upper folders. Are you sure you're in a Simple Application Framework project?"
        		else
          			rsync :down, shared_files_path, path, :once => true
        		end
			end
			task :put do
				path = find_folder_in_parents('files')
        		if !path
          			abort "No files folder found in this or upper folders. Are you sure you're in a Simple Application Framework project?"
        		else
          			rsync :up, "#{path}/", shared_files_path
        		end
			end
		end
	end


	# define some extra folder to create
	set :shared_children, %w(config/library files)

	# custom events configuration
	after 'deploy:update_code' do
		# change the path to current_path
		run "if [ -f #{shared_path}/config/library/globals.php ]; then sed -i 's/#{version_dir}\\/[0-9]*/#{current_dir}/' #{shared_path}/config/library/globals.php; fi"

		# symlink the globals
		run %{
			ln -sf #{shared_path}/config/library/globals.php #{release_path}/library/globals.php
		}

		folders = capture("ls -1 #{release_path}/files").split(/\r?\n/)

		# loop the folders
		folders.each do |folder|
			# copy them to the shared path, remove them from the release and symlink them
			run %{
				mkdir -p #{shared_path}/files/#{folder} &&
				cp -r #{release_path}/files/#{folder} #{shared_path}/files/ &&
				rm -rf #{release_path}/files/#{folder} &&
				ln -s #{shared_path}/files/#{folder} #{release_path}/files/#{folder}
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