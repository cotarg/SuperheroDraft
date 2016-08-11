class Match < ActiveRecord::Base
  has_one :player_one, class_name: "User"
  has_one :player_two, class_name: "User"
  has_one :player_three, class_name: "User"
  has_one :player_four, class_name: "User"
  has_many :teams
  

end
