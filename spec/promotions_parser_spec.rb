require 'promotions_parser'

RSpec.describe PromotionsParser do
  let(:promotion_parser) { described_class.new promo_rules_json }

  describe '#value_rules' do
    subject { promotion_parser.value_rules.first }

    it 'returns value rules from promotions' do
      expect(subject).to have_key(:minimum_value)
      expect(subject).to have_key(:discount_decimal)
    end
  end

  describe '#volume_rules' do
    let(:product_code) { "001".to_sym }

    subject { promotion_parser.volume_rules }

    it { expect(subject).to have_key(product_code)}
    it { expect(subject[product_code]).to have_key :minimum_volume_required }
    it { expect(subject[product_code]).to have_key :discounted_price }
  end
end