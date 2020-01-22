class Pub
attr_reader :name, :till
def initialize(name, till, drinks)
  @name = name
  @till = till
  @drinks = drinks

end


  def increase_till(drink)
    @till += drink.price
  end

  def allowed_to_sell(customer, drink)
    if customer.age < 18 && drink.alcohol_level == 0
      return true
    elsif customer.age>=18 && customer.drunkeness_lvl < 15
      return true
    else
      return false
    end
  end

  def sell_drink(customer, drink)
    if customer.cash >= drink.price && allowed_to_sell(customer,drink)
      customer.reduce_customer_money(drink)
      customer.increase_drunkeness(drink)
      increase_till(drink)
    else
      return nil
    end
  end
  def sell_food(customer, food)
    if customer.cash >= food.price &
      customer.reduce_customer_money(food)
      customer.increase_rejuvenation(food)
      increase_till(food)
    else
      return nil
    end
  end

  # def is_customer
  # end


end
