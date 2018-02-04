require_relative 'promotions_parser'

class PromotionsHandler
  def initialize promotions, products
    @products = products
    @promotions_parser = PromotionsParser.new promotions
    @value_rules = @promotions_parser.value_rules
    @volume_rules = @promotions_parser.volume_rules
  end

  def apply_volume_discounts basket
    basket.inject(0) do |sum, (product_code, quantity)|
      sum + quantity * get_price(product_code, quantity)
    end
  end

  def apply_value_discounts basket_amount
    value_discount_rate = get_value_rate(basket_amount)
    (basket_amount * ( 1 - value_discount_rate)).round(2)
  end

  private

    def get_value_rate basket_amount
      rate = 0
      @value_rules.each do |value_rule|
        rate = value_rule[:discount_decimal] if basket_amount >= value_rule[:minimum_value]
      end
      rate
    end

    def get_price product_code, quantity
      get_discounted_price(product_code, quantity) || get_regular_price(product_code)
    end

    def get_discounted_price product_code, quantity
      if promotion_exists?(product_code) && minimum_volume_met?(product_code, quantity)
        discounted_price(product_code)
      end
    end

    def get_regular_price product_code
      @products.dig product_code, :price
    end

    def minimum_volume_met? product_code, quantity
      quantity >= minimum_volume_required(product_code)
    end

    def minimum_volume_required product_code
      @volume_rules.dig product_code, :minimum_volume_required
    end

    def promotion_exists? product_code
      @volume_rules[product_code]
    end

    def discounted_price product_code
      @volume_rules.dig product_code, :discounted_price
    end
end