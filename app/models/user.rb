class User < ActiveRecord::Base
  has_many :votes
  has_many :matches
  has_many :teams
end
