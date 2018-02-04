require 'checkout'

RSpec.describe 'Feature' do
  let(:checkout){ Checkout.new(promo_rules_json) }

  subject { checkout.total }

  it 'returns the correct basket amount based on value rules' do
    checkout.scan('003')
    checkout.scan('003')
    checkout.scan('003')
    expect(subject).to eq 59.85
  end

  it 'eturns the correct basket amount based on volume rules' do
    checkout.scan('001')
    checkout.scan('002')
    checkout.scan('001')
    expect(subject).to eq 55.80
  end

  it 'eturns the correct basket amount based on value and volume rules' do
    checkout.scan('001')
    checkout.scan('003')
    checkout.scan('003')
    checkout.scan('002')
    expect(subject).to eq(84.74)
  end

end
