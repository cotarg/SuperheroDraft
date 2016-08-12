require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  extend Minitest::Spec::DSL

  let(:hero_one) { Hero.new("Clive", "Normal Guy", "A totally normal guy. Person Man.", "yahoo.com", "test data", "M") }
  let(:hero_two) { Hero.find_all("superman") }
  let(:hero_three) { Hero.find_char("1254") }
  let(:hero_four) { Hero.normalize(Hero.find_char("1254")) }

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
    assert_equal hero_one.aliases, "Normal Guy"
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
    refute_nil hero_two
  end

  test "Hero can find specified hero by id" do
    refute_nil hero_three
  end

  test "hero can be instantiated from Hero.find_char()" do
    refute_nil hero_four
  end


end
