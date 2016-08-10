require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "it exists" do
    refute_nil Team
  end

  test "it creates a new team" do
    test_team = Team.new()
    refute_nil test_team
  end

end
