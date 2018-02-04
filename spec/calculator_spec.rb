require 'calculator'

RSpec.describe Calculator do
  let(:basket) { { '002': 3 } }

  subject { described_class.new(promo_rules_json, dummy_products) }

  describe '#total' do

    before do
      allow(subject).to receive(:get_discounted_price).and_return false
    end

    it 'returns correct total for basket' do
      expect(subject.total(basket)).to eq 121.5
    end
  end
end