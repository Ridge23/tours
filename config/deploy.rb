lock '3.5.0'

set :application, 'TravelApp'
set :repo_url, 'git@github.com:Ridge23/tours.git'
set :user, 'ubuntu'
set :rbenv_ruby, '2.3.0'

set :puma_bind, 'tcp://0.0.0.0:9292'

set :domain, '52.29.110.91'

# Roles
role :web, domain
role :app, domain
role :db,  domain, :primary => true