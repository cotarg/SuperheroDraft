# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

users = CSV.read('seed_csvs/users.csv', :headers => true)
user_hash = {}
users.each do |row|
  user_hash[:provider] = row[0].to_i
  user_hash[:uid] = row[1].to_s
  user_hash[:name] = row[2].to_s
  user_hash[:image] = row[3].to_s
  User.create(user_hash)
end
