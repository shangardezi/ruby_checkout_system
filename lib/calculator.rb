require 'promotions_handler'

class Calculator
  def initialize promotions, products
    @promotion_handler = PromotionsHandler.new promotions, products
    @products = products
  end

  def total basket
    basket_amount = @promotion_handler.apply_volume_discounts basket
    @promotion_handler.apply_value_discounts basket_amount
  end
end