require './promotion/minimum_quantity_rule'

RSpec.describe Promotion::MinimumQuantityRule do
  describe 'Rule' do
    let(:product) { Product.new({code: '001', name: 'Lavender heart', price: 9.25}) }
    let(:minimum_quantity) { 2 }
    let(:discounted_price) { 8.5 }

    context 'Minimum Quantity Rule' do
      let(:rule) { Promotion::MinimumQuantityRule.new({ product: product, minimum_quantity: minimum_quantity, discounted_price: discounted_price }) }
      it 'matches the expected values' do
        expect(rule.minimum_quantity).to eq minimum_quantity
        expect(rule.discounted_price).to eq discounted_price
      end
    end
  end
end
