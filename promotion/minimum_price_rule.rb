module Promotion
  class MinimumPriceRule
    attr_accessor :minimum_price, :discount_percent

    def initialize(*params)
      @minimum_price = params[0][:minimum_price]
      @discount_percent = params[0][:discount_percent]
    end

    def discount_value(total)
      total >= @minimum_price ? total * @discount_percent : 0
    end
  end
end
