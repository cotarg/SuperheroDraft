require 'minitest/autorun'
require 'minitest/pride'

class TeamTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "it exists" do
    refute_nil SuperheroDraft::Team
  end

end
