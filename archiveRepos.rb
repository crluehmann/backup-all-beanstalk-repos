#!/usr/bin/ruby

#
# requires the http and json gems
# ~gem install http json
# also requires that git is installed locally
#

require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('http://your_sub_domain.beanstalkapp.com/api/repositories.json')

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
request.basic_auth("your_username", "your_auth_token")
response = http.request(request)

allRepos = JSON.parse(response.body)

# #collect our repos
# allRepos = Beanstalk::API::Repository.find(:all)

allRepos.each do |repo|
	repoUrl = repo['repository']['repository_url']
    repoName = repo['repository']['name']
	
	#need to see if we have the repo already or not. Can't re-clone if it already exists
	if File.directory? repoName
		#we already have the repo, just pull changes inside the right dir
		cmd = "git remote update"
		Dir.chdir(repoName) do
			system cmd
		end
	else
		#we don't have the repo yet, clone it
		cmd = "git clone --mirror #{repoUrl}"
		system cmd
	end
end