class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :votes
end
