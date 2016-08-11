require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  extend Minitest::Spec::DSL

  let(:hero_one) { Hero.new("Clive", "Normal Guy", "A totally normal guy. Person Man.", "yahoo.com", "test data", "M") }

  test "it exists" do
    refute_nil Hero
  end

  test "it can instantiate" do
    refute_nil hero_one
  end

  test "a hero has a name" do
    assert_equal hero_one.name, "Clive"
  end

  test "a hero has a list of aliases" do
    refute_nil hero_one.aliases
  end

  test "a hero has a description" do
    refute_nil hero_one.description
  end

  test "a hero has an image" do
    # the model should contain a field for image url
    refute_nil hero_one.image_url
  end

  test "a hero has an key/value pair representing id and supplying api" do
    # there should be a field for this hash
    refute_nil hero_one.id_obj
  end

  test "Hero can find all characters of a given name" do
    hero_two = Hero.find_all("superman")
    puts hero_two.first
    refute_nil hero_two
  end


end
