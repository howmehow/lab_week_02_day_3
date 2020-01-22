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
    else
      return false
    end
  end
  #
  # def sell_drink(customer, drink)
  #   if customer.age >=18 && customer.cash >= drink.price
  #     customer.reduce_customer_money(drink)
  #     customer.increase_drunkeness(drink)
  #     increase_till(drink)
  #   else
  #     return nil
  #   end
  # end
  #
  # def sell_drink_to_underage(customer, drink)
  #   if customer.age >=18 && customer.cash >= drink.price && drink.alcohol_level = 0
  #     customer.reduce_customer_money(drink)
  #     increase_till(drink)
  #   else
  #     return nil
  #   end
  # end


end
