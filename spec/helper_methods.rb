require 'json'

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

  def dummy_products
    { '001': { name: 'Very Cheap Chair', price: 9.25 },
      '002': { name: 'Little table', price: 45.00 },
      '003': { name: 'Funkly light', price: 19.95 } }
  end

  def promo_rules_json
    promo_rules.to_json
  end
end