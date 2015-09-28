# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute('TRUNCATE ' + AdminUser.table_name + ' RESTART IDENTITY') #
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')


ActiveRecord::Base.connection.execute('TRUNCATE ' + Country.table_name + ' RESTART IDENTITY')

#countries_csv_path = File.join(Rails.root, 'db', 'GeoIPCountryWhois.csv')

#CSV.foreach(countries_csv_path, :headers => true, :col_sep => ',') do |row|
#  if !Country.find_by_iso_name(row['iso'])
#    Country.create({ name: row['name'], iso_name: row['iso'] })
#  end
#end

ActiveRecord::Base.connection.execute('TRUNCATE ' + City.table_name + ' RESTART IDENTITY') #

#cities_csv_path = File.join(Rails.root, 'db', 'GeoLiteCity-Location.csv')

#CSV.foreach(cities_csv_path, :headers => true, :col_sep => ',') do |row|
#  if row['country'] and row['city']
#    city_country = Country.find_by_iso_name(row['country'])
#    if(city_country)
#      City.create({ name: row['city'], country_id: city_country.id })
#    end
#  end
#end

ActiveRecord::Base.connection.execute('TRUNCATE ' + AssetType.table_name + ' RESTART IDENTITY')
AssetType.create({ title: 'Text', published: true})
AssetType.create({ title: 'Audio', published: true})

ActiveRecord::Base.connection.execute('TRUNCATE ' + PaidCondition.table_name + ' RESTART IDENTITY')
PaidCondition.create({ title: 'Free', enabled: true})
PaidCondition.create({ title: 'Charge', enabled: true})