require 'test_helper'

class HeroTest < ActiveSupport::TestCase
  
  test "it exists" do
    Hero.new.wont_be_nil
  end

end
