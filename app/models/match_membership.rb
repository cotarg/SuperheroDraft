class MatchMembership < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  has_one :team
end
