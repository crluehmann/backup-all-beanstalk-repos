#Backup your Beanstalk repos using Beanstalkapp API & Ruby
****

It's super simple! All this script does is utilize the Beanstalkapp API to connect to your account (must have API access enabled in your account), get the list of all of your repos in your account, then it will clone any repos it hasn't cloned yet. And if it has cloned it, it will pull all the latest changes, branches, tags, etc.

This was originally built so that I have a local archive of all of my work in case Beanstalkapp goes down one day. Or for those who are hesitant about trusting cloud-based stuff.

###Steps & Requirements

- Update the archiveRepos.rb with your username, password, and subdomain of your account (e.g. 'markdown')

- Must have Ruby installed (tested with 1.8.7)

- Must install the 'beanstalkapp' gem: $ gem install beanstalkapp *Might have to run this as sudo*

- Must have git installed

- Create a cron job to run this at whatever interval you desire! *(Probably nightly)*