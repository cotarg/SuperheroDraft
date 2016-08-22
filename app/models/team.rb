class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :votes

  def heroes
    Hero.group([hero_one, hero_two, hero_three, hero_four, hero_five, hero_six])
  end

  def villains
    Hero.group([villain_one, villain_two, villain_three, villain_four])
  end
end
