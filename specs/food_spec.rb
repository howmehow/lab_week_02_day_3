require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food.rb')

class TestFood < Minitest::Test

  def setup
    @food1 = Food.new("Pizza", 10, -10)
    @food2 = Food.new("Chips", 6, -5)
    @food3 = Food.new("Fish and Chips", 15, -8)
  end

  def test_get_rejuvenation_level
    assert_equal(-5, @food2.rejuvenation_level)
  end


end
