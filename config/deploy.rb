lock '3.5.0'

set :application, 'TravelApp'
set :repo_url, 'git@github.com:Ridge23/tours.git'
set :user, 'ubuntu'
set :rbenv_ruby, '2.3.0'

set :puma_bind, 'tcp://0.0.0.0:9292'

# Roles
role :web, '52.29.110.91'
role :app, '52.29.110.91'
role :db, '52.29.110.91', :primary => true
