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
    @food1 = Food.new("Pizza", 10, -10)
    @food2 = Food.new("Chips", 6, -5)
    @food3 = Food.new("Fish and Chips", 15, -8)
  end

  def test_get_till
    assert_equal(250, @pub.till)
  end

  def test_increase_till
    @pub.increase_till(@drink3)
    assert_equal(258, @pub.till)
  end

  def test_allowed_to_sell
    result = @pub.allowed_to_sell(@customer2, @drink2)
    assert_equal(false, result)
  end

  def test_sell_drink
    @pub.sell_drink(@customer1, @drink2)
    assert_equal(1495, @customer1.cash)
    assert_equal(255, @pub.till)
    assert_equal(5, @customer1.drunkeness_lvl)
  end

  def test_sell_food
    @pub.sell_food(@customer1, @food1)
    assert_equal(1490, @customer1.cash)
    assert_equal(260, @pub.till)
    assert_equal(-10, @customer1.drunkeness_lvl)
  end

  def test_is_customer_drunk
    @pub.sell_drink(@customer3, @drink3)
    @pub.sell_drink(@customer3, @drink3)
    @pub.sell_drink(@customer3, @drink3)
    @pub.sell_drink(@customer3, @drink3)
    customer_allowed = @pub.allowed_to_sell(@customer3, @drink3)
    assert_equal(false, customer_allowed)
  end

  def test_is_everything_working
    @pub.sell_drink(@customer3, @drink3)
    @pub.sell_drink(@customer3, @drink1)
    @pub.sell_food(@customer3, @food1)
    @pub.sell_food(@customer3, @food1)
    @pub.sell_drink(@customer3, @drink3)
    customer_allowed = @pub.allowed_to_sell(@customer3, @drink3)
    assert_equal(9961, @customer3.cash)
    assert_equal(true, customer_allowed)
    assert_equal(-4, @customer3.drunkeness_lvl)
    assert_equal(289, @pub.till)
  end

  def test_remove_drink_from_stock
    remaining_stock = @pub.remove_drink_from_stock(@drink1)
    assert_equal(49, remaining_stock)
  end

end
