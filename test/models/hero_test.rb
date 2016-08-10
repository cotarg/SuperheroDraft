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

  test "a hero has a description" do
    # set up a test case? use fixtures?
  end

  test "a hero has an image" do
    # the model should contain a field for image url
  end

  test "a hero has an key/value pair representing id and supplying api" do
    # there should be a field for this hash
  end


end
