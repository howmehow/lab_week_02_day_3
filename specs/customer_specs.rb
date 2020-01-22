require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../food.rb')

class TestCustomer < Minitest::Test

  def setup
    @customer1 = Customer.new("Bob", 55, 1500)
    @customer2 = Customer.new("Zsolt", 17, 15)
    @customer3 = Customer.new("Maria", 20, 10000)
    @drink = Drink.new("Beer", 7, 7)
    @drink1 = Drink.new("Coke", 3, 0)
    @food1 = Food.new("Pizza", 10, -10)
    @food2 = Food.new("Chips", 6, -5)
    @food3 = Food.new("Fish and Chips", 15, -8)

  end

  def test_get_cash
    assert_equal(10000, @customer3.cash)
  end
  def test_get_drunkeness_level
    assert_equal(0, @customer1.drunkeness_lvl)
  end

  def test_reduce_customer_money()
    @customer3.reduce_customer_money(@drink)
    assert_equal(9993, @customer3.cash)
  end

  def test_increase_drunkeness
    @customer3.increase_drunkeness(@drink)
    assert_equal(7, @customer3.drunkeness_lvl)

  end
  def test_increase_drunkeness__no_alcohol
    @customer3.increase_drunkeness(@drink1)
    assert_equal(0, @customer3.drunkeness_lvl)

  end

  def test_increase_rejuvenation
    @customer3.increase_rejuvenation(@food1)
    assert_equal(-10, @customer3.drunkeness_lvl)
  end

end
