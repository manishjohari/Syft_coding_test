require './checkout'

RSpec.describe Checkout do
  describe '#total' do
    let(:lavender_heart) { Product.new({code: '001', name: 'Lavender heart', price: 9.25}) }
    let(:personalised_cufflinks) { Product.new({code: '002', name: 'Personalised cufflinks', price: 45}) }
    let(:kids_tshirt) { Product.new({code: '003', name: 'Kids T-shirt', price: 19.95}) }
    let(:minimum_quantity_rule) { Promotion::MinimumQuantityRule.new({product: lavender_heart, minimum_quantity: 2, discounted_price: 8.5}) }
    let(:minimum_price_rule) { Promotion::MinimumPriceRule.new({minimum_price: 60, discount_percent: 0.1}) }
    let(:promotional_rules) { [minimum_quantity_rule, minimum_price_rule] }
    let(:checkout) { Checkout.new(promotional_rules) }

    context 'There is no item in the order' do
      let(:expected_result) { 0 }

      it 'returns 0 as default total' do
        expect(checkout.total.round(2)).to eq expected_result
      end
    end

    context 'Both rules are applied' do
      let(:expected_result) { 8.50*2 }

      it 'returns total with both rules applied' do
        2.times {checkout.scan(lavender_heart)}

        expect(checkout.total.round(2)).to eq expected_result
      end
    end

    context 'There are items in the order' do
      context 'No rule is applied' do
        let(:expected_result) { 29.2 }

        it 'returns original total' do
          checkout.scan(lavender_heart)
          checkout.scan(kids_tshirt)

          expect(checkout.total.round(2)).to eq expected_result
        end
      end

      context 'Only total price rule is applied' do
        let(:expected_result) { 66.78 }

        it 'returns total with total price rule applied' do
          checkout.scan(lavender_heart)
          checkout.scan(personalised_cufflinks)
          checkout.scan(kids_tshirt)

          expect(checkout.total.round(2)).to eq expected_result
        end
      end

      context 'Only specific product rule is applied' do
        let(:expected_result) { 36.95 }

        it 'returns total with total price rule applied' do
          checkout.scan(lavender_heart)
          checkout.scan(kids_tshirt)
          checkout.scan(lavender_heart)

          expect(checkout.total.round(2)).to eq expected_result
        end
      end

      context 'Both rules are applied' do
        let(:expected_result) { 73.76 }

        it 'returns total with both rules applied' do
          checkout.scan(lavender_heart)
          checkout.scan(kids_tshirt)
          checkout.scan(lavender_heart)
          checkout.scan(personalised_cufflinks)

          expect(checkout.total.round(2)).to eq expected_result
        end
      end

      context 'Both rules are applied' do
        let(:expected_result) { 61.20 }

        it 'returns total with both rules applied' do
          8.times {checkout.scan(lavender_heart)}

          expect(checkout.total.round(2)).to eq expected_result
        end
      end
    end
  end
end
