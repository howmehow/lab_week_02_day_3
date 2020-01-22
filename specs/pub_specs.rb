require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')
require_relative('../pub.rb')

class TestPub < Minitest::Test

  def setup



    @customer1 = Customer.new("Bob", 55, 1500)
    @customer2 = Customer.new("Zsolt", 17, 15)
    @customer3 = Customer.new("Maria", 20, 10000)

    @drink1 = Drink.new("Coke", 3, 0)
    @drink2 = Drink.new("Wine", 5, 5)
    @drink3 = Drink.new("Whiskey", 8, 8)
    drinks = [@drink1, @drink2, @drink3]
    @pub = Pub.new("Codeclan", 250, drinks)

  end



  def test_get_till
    assert_equal(250, @pub.till)
  end


end
