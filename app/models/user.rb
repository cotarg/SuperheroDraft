class User < ActiveRecord::Base
  has_many :votes
  has_many :matches, through: :match_membership
  has_many :teams
end
