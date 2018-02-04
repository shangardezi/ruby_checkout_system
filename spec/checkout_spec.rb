require 'checkout'
require 'pry'

RSpec.describe Checkout do

  subject { described_class.new promo_rules_json }

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
    let(:basket) { {'001': 3} }
    let(:calculator) { subject.calculator }

    before do
      3.times { subject.scan('001') }
    end

    it 'requests total from the Calculator' do
      expect(calculator).to receive(:total).with(basket)
      subject.total
    end
  end
end