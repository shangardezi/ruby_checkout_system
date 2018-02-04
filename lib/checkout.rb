class Checkout
  PRODUCTS =  { '001': { name: 'Very Cheap Chair', price: 9.25 },
                '002': { name: 'Little table', price: 45.00 },
                '003': { name: 'Funkly light', price: 19.95 } }

  PRODUCT_NOT_FOUND_ERROR = "Product not found"

  def initialize promo_rules

  end

  def scan product_code
    PRODUCTS[product_code.to_sym] ? add_to_basket(product_code) : raise(PRODUCT_NOT_FOUND_ERROR)
  end

  def total

  end

  private

    def add_to_basket product_code

    end
end