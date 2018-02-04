module HelperMethods
  def promo_rules
    {
      value_rules: [
         {
           minimum_value: 60,
           discount_decimal: 0.1
         }
           ],
      volume_rules: {
        "001": {
          minimum_volume_required: 2,
          discounted_price: 8.50
        }
      }
    }
  end
end