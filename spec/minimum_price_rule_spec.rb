require './promotion/minimum_price_rule'

RSpec.describe Promotion::MinimumPriceRule do
  describe 'Rule' do
    let(:minimum_price) { 60 }
    let(:discount_percent) { 0.1 }

    context 'Minimum Quantity Rule' do
      let(:rule) { Promotion::MinimumPriceRule.new({ discount_percent: discount_percent, minimum_price: minimum_price }) }
      it 'matches the expected values' do
        expect(rule.minimum_price).to eq minimum_price
        expect(rule.discount_percent).to eq discount_percent
      end
    end
  end
end
