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

end

# consider extracting to individual team calculations, 
# and having match assemble them as a single object.
