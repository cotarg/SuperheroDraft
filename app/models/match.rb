class Match < ActiveRecord::Base
  has_one :player_one, class_name: "User"
  has_one :player_two, class_name: "User"
  has_one :player_three, class_name: "User"
  has_one :player_four, class_name: "User"
  has_many :teams
  
  def self.assemble_match_votes(match_id)
    teams = Team.where(match_id: match_id)
    votes = {}

    teams.each do |team|
      id = team.id
      votes[id] = Vote.where(team_id: team.id).count
    end

    return votes
  end

end
