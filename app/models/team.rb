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

  def next_hero
    heroes = ["one", "two", "three", "four", "five", "six"]
    heroes.each do |hero|
      if self.send("hero_#{hero}").nil?
        return self.send("hero_#{hero}")
      end
    end
  end

  def next_villain
    villains = ["one", "two", "three", "four"]
    villains.each do |villain|
      if self.send("villain_#{villain}").nil?
        return self.send("villain_#{villain}")
      end
    end
  end
end
