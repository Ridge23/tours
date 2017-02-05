lock '3.6.0'

set :application, 'TravelApp'
set :repo_url, 'git@github.com:Ridge23/tours.git'
set :user, 'ubuntu'
set :rbenv_ruby, '2.3.0'

set :puma_bind, 'tcp://0.0.0.0:3000'

# Roles
role :web, '52.29.110.91'
role :app, '52.29.110.91'
role :db, '52.29.110.91', :primary => true

desc "Seed the database."
task :seed_db do
  on roles(:app) do
    within "#{current_path}" do
      with rails_env: :production do
        execute :rake, "db:seed"
      end
    end
  end
end

after 'deploy:publishing', 'deploy:restart'