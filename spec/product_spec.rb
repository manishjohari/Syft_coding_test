require './product'

RSpec.describe Product do
  describe 'product' do
    let(:code) { '001' }
    let(:name) { 'Lavender heart' }
    let(:price) { 9.25 }
    

    context 'Product Initialize with code, name, price' do
      let(:lavender_heart) { Product.new({code: code, name: name, price: price}) }
      it 'matches the expected values' do
        expect(lavender_heart.code).to eq code
        expect(lavender_heart.name).to eq name
        expect(lavender_heart.price).to eq price
      end
    end


    context 'Product Initialize with any order name, code, price' do
      let(:lavender_heart) { Product.new({name: name, code: code, price: price}) }
      it 'matches the expected values' do
        expect(lavender_heart.code).to eq code
        expect(lavender_heart.name).to eq name
        expect(lavender_heart.price).to eq price
      end
    end
  end
end
