require 'promotions_handler'

RSpec.describe PromotionsHandler do

  subject { described_class.new promo_rules, dummy_products }

  describe '#apply_volume_discounts' do
    let(:basket) { { '001': 2 } }

    it 'applies correct volume discount' do
      expect(subject.apply_volume_discounts(basket)).to eq 17
    end
  end

  describe '#apply_value_discounts' do
    let(:price) { 45.00 }
    let(:basket_amount) { 10 * price }
    let(:basket) { { '002': 10 } }

    it 'applies the correct value based discount' do
      expect(subject.apply_value_discounts(basket_amount)).to eq 405
    end
  end
end