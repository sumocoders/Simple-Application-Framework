load "deploy" if respond_to?(:namespace) # cap2 differentiator

# development information
set :client,  ""					# eg: "dev"
set :project, ""					# eg: "site"

# production information, ignore these items during development
set :production_url, ""				# eg: "http://fork.sumocoders.be"
set :production_account, ""			# eg: "sumocoders"
set :production_hostname, ""		# eg: "web01.crsolutions.be"
set :production_document_root, ""	# eg: "/home/#{production_account}/#{production_url.gsub("http://","")}"
set :production_db, ""				# eg: "sumocoders_site"
set :production_errbit_api_key, ""	# eg: "7cb0894de51936c39d86b4f2ab4713f2"

# repo information
set :repository, ""					# eg: "git@github.com:sumocoders/forkcms.git"

# stages
set :stages, %w{production staging}
set :default_stage, "staging"
set :stage_dir, "deployment"

require "capistrano/ext/multistage"
require "forkcms_deploy"
require "forkcms_deploy/defaults"
require "sumodev_deploy"
load "./deployment/overwrites"

# UNCOMMENT THIS IF YOU'RE USING Compass 
#after 'deploy:update_code', 'assets:precompile'
