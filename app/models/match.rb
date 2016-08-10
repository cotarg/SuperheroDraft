class Match < ActiveRecord::Base
  has_many :users
  has_many :teams, through :users
  

end
