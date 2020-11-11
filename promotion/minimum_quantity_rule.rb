module Promotion
  class MinimumQuantityRule
    attr_accessor :product, :minimum_quantity, :discounted_price
    def initialize(*params)
      @product = params[0][:product]
      @minimum_quantity = params[0][:minimum_quantity]
      @discounted_price = params[0][:discounted_price]
    end

    def discount_value(list_products)
      matched_products_number = list_products.select{ |pro| pro.code == @product.code }.size
      matched_products_number < @minimum_quantity ? 0 : (@product.price - @discounted_price) * matched_products_number
    end
  end
end
