class Drink

  attr_reader :name, :price, :alcohol_level
  attr_accessor :stock_count

  def initialize(name, price, alcohol_level)
    @name = name
    @price = price
    @alcohol_level = alcohol_level
    @stock_count = 50
  end

end
