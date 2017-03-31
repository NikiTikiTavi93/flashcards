bash "setup application" do
  user 'ubuntu'
  cwd node['app_start']['app_dir']
  code <<-EOC
    sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev libcurl4-openssl-dev python-software-properties libpq-dev postgresql postgresql-contrib
    gem install pg
		bundle install
		cp config/database.yml.sample config/database.yml
		bundle exec rake db:create
		bundle exec rake db:migrate
		bundle exec rake db:seed
  EOC
end

bash "start server" do
  user 'ubuntu'
  cwd node['app_start']['app_dir']
  code <<-EOC
		bundle exec rails s -b 0.0.0.0 --daemon
  EOC
end
