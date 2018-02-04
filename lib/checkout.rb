require 'errors'
require 'calculator'

class Checkout
  include Errors

  attr_reader :calculator, :basket

  PRODUCTS =  { '001': { name: 'Very Cheap Chair', price: 9.25 },
                '002': { name: 'Little table', price: 45.00 },
                '003': { name: 'Funkly light', price: 19.95 } }

  def initialize promo_rules
    promotions = promo_rules
    @calculator = Calculator.new promotions, PRODUCTS
    @basket = Hash.new 0
  end

  def scan product_code
    PRODUCTS[product_code.to_sym] ? add_to_basket(product_code) : raise(PRODUCT_NOT_FOUND_ERROR)
  end

  def total
    @calculator.total @basket
  end

  private

    def add_to_basket product_code
      @basket[product_code.to_sym] += 1
    end
end