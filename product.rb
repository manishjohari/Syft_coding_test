class Product
  attr_accessor :code, :name, :price
  
  def initialize(*params)
    @code = params[0][:code]
    @name = params[0][:name]
    @price = params[0][:price]
  end
end
