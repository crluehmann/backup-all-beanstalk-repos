#!/usr/bin/ruby

#
# requires the beanstalkapp gem! >> might need to be run as sudo
# ~gem install beanstalkapp
# also requires that git is installed locally
#

require 'rubygems'
require 'beanstalkapp'

Beanstalk::API::Base.setup(
	:domain		=> 'YOUR_SUBDOMAIN_HERE',
	:login		=> 'YOUR_LOGIN',
	:password	=> 'YOUR_PASSWORD'
)

#collect our repos
allRepos = Beanstalk::API::Repository.find(:all)

allRepos.each do |repo|
	repoId = repo.attributes['id']
	repoData = Beanstalk::API::Repository.find(repoId)
	repoUrl = repoData.attributes['repository_url']
	repoName = repoData.attributes['name']
	
	#need to see if we have the repo already or not. Can't re-clone if it already exists
	if File.directory? repoName
		#we already have the repo, just pull changes inside the right dir
		cmd = "git pull"
		Dir.chdir(repoName) do
			system cmd
		end
	else
		#we don't have the repo yet, clone it
		cmd = "git clone #{repoUrl}"
		system cmd
	end
end