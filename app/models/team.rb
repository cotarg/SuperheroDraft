class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :votes

  MAX_HERO = 6
  MAX_VILLAIN = 4

  def heroes
    Hero.group([hero_one, hero_two, hero_three, hero_four, hero_five, hero_six])
  end

  def villains
    Hero.group([villain_one, villain_two, villain_three, villain_four])
  end

  def set_char(type, char_id)
    numbers = ["one", "two", "three", "four", "five", "six"]
    Team.const_get("MAX_#{type.upcase}").times do |i|
      attribute = "#{type}_#{numbers[i]}"
      if self.send(attribute).nil?
        return update(attribute => char_id)
      end
    end
    return false
  end

end
