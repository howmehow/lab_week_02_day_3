require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink.rb')

class TestDrink < Minitest::Test

  def setup
    @drink1 = Drink.new("Coke", 3, 0)
    @drink2 = Drink.new("Wine", 5, 5)
    @drink3 = Drink.new("Whiskey", 8, 8)
    drinks = [@drink1, @drink2, @drink3]
  end

  def test_get_name
    assert_equal("Coke", @drink1.name)
  end

end
