class Match < ActiveRecord::Base
  has_one :player_one, class_name: "User"
  has_one :player_two, class_name: "User"
  has_one :player_three, class_name: "User"
  has_one :player_four, class_name: "User"
  has_many :teams
  
  def votes

    votes = {}

    teams.each do |team|
      id = team.id
      votes[id] = team.votes.count
    end

    return votes
  end

  def self.check_team_membership(id)
    if Team.where(match_id: id).count >= 4
      return false
    else 
      return id
    end
  end

  def self.find_match(match_seeds)
    index = rand(0..(match_seeds.length - 1))
    match = match_seeds[index]

    if Match.check_team_membership(match) == false
      Match.find_match(match_seeds)
    else
      return match
    end
  end

end

# consider extracting to individual team calculations, 
# and having match assemble them as a single object.
