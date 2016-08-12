# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# matches don't require anything except an ID because it functions as a join. 180 is an arbitrary number.
180.times do
  Match.create
end

users = CSV.read('seed_csvs/users.csv', :headers => true)
user_hash = {}
users.each do |row|
  user_hash[:provider] = row[0].to_s
  user_hash[:uid] = row[1]
  user_hash[:name] = row[2].to_s
  user_hash[:image] = row[3].to_s
  user = User.create(user_hash)
  rand(8).times do
    team_hash = {}

    team_hash[:user_id] = user.id
    # hero and villain ids are generated for seeds by using upper and lower bounds of range in API
    team_hash[:hero_one] = 1 + rand(1253..131968)
    team_hash[:hero_two] = 1 + rand(1253..131968)
    team_hash[:hero_three] = 1 + rand(1253..131968)
    team_hash[:hero_four] = 1 + rand(1253..131968)
    team_hash[:hero_five] = 1 + rand(1253..131968)
    team_hash[:hero_six] = 1 + rand(1253..131968)
    team_hash[:villain_one] = 1 + rand(1253..131968)
    team_hash[:villain_two] = 1 + rand(1253..131968)
    team_hash[:villain_three] = 1 + rand(1253..131968)
    team_hash[:villain_four] = 1 + rand(1253..131968)
    team_hash[:cover_url] = "cover.jpg"
    team_hash[:playlist_url] = "spotify link"
    team_hash[:pitch] = "coming soon"
    team_hash[:name] = "team name"
    team_hash[:match_id] = Match.offset(rand(Match.count)).first.id
    Team.create(team_hash)
  end
end

# 5000 is also an arbitrary number. This will also have to change. :)
5000.times do 
  user_offset = rand(User.count)
  team_offset = rand(Team.count)
  
  vote_hash = {user_id: User.offset(user_offset).first.id, team_id: Team.offset(team_offset).first.id }
  Vote.create(vote_hash)
end