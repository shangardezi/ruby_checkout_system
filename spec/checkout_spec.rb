require 'checkout'

RSpec.describe Checkout do

  subject { described_class.new promo_rules }

  describe '#scan' do
    let(:invalid_product_error) { Checkout::PRODUCT_NOT_FOUND_ERROR }

    it "raises a product not found error if product doesn't exist" do
      expect{ subject.scan('foo_bar') }.to raise_error invalid_product_error
    end

    it 'adds valid products to the basket' do
      expect(subject).to receive(:add_to_basket).with('003')
      subject.scan('003')
    end
  end

  describe '#total' do

  end

  private

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