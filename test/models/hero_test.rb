require 'test_helper'

class HeroTest < ActiveSupport::TestCase

  test "it exists" do
    refute_nil Hero
  end

  test "it can instantiate" do
    test_hero = Hero.new("clive")
    refute_nil test_hero
  end

  test "a hero has a name" do
    test_hero = Hero.new("clive")
    assert_equal test_hero.name, "clive"
  end

end
