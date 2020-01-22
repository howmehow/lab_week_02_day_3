class Customer

attr_reader :name, :age, :drunkeness_lvl
attr_accessor :cash
def initialize(name, age, cash)
  @name = name
  @age = age
  @cash = cash
  @drunkeness_lvl = 0
end

  def reduce_customer_money(product)
    @cash -= product.price
  end

  def increase_drunkeness(drink)
    @drunkeness_lvl += drink.alcohol_level
  end

  def increase_rejuvenation(food)
    @drunkeness_lvl += food.rejuvenation_level
  end
end
