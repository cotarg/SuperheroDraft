require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "it exists" do
    team = Team.save()
    team.wont_be_nil
  end

end
