#Backup your Beanstalk repos using Beanstalkapp API & Ruby
****

It's super simple! All this script does is utilize the Beanstalkapp API to connect to your account (must have API access enabled in your account), get the list of all of your repos in your account, then it will clone any repos it hasn't cloned yet. And if it has cloned it, it will pull all the latest changes, branches, tags, etc.

This was originally built so that I have a local archive of all of my work in case Beanstalkapp goes down one day. Or for those who are hesitant about trusting cloud-based stuff.

###Steps & Requirements

- Update the archiveRepos.rb with your username, auth tokeen, and subdomain of your account

- Must have Ruby installed (tested with 1.8.7)

- Must install the 'json' and 'http' gem: $ gem install http; gem install json

- Must have git installed & run $ git init

- Create a cron job to run this at whatever interval you desire! *(Probably nightly)*

## Major Update
Oct 1, 2014

The original beanstalkapp gem is no longer supported and working. Turns out they stopped supporting it almost 3 years ago but it still worked fine. Use the newest version to make sure it keeps working properly now and in the future.

This release is using the standard http library for ruby to run raw HTTP requests to get the data, so it should work much better and not rely on their abondoned gem.