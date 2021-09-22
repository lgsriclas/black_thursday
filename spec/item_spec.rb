require 'rspec'
require './lib/item'
require 'bigdecimal'
require 'time'

describe 'Item' do
  describe '#initialize' do
    before do
      @item = Item.new({
                :id          => 1,
                :name        => "Pencil",
                :description => "You can use it to write things",
                :unit_price  => BigDecimal(10.99,4),
                :created_at  => Time.now.to_s,
                :updated_at  => Time.now.to_s,
                :merchant_id => 2
              })
    end

    it 'is an instance of Item' do
      expect(@item).to be_an_instance_of Item
    end

    it 'has an id' do
      expect(@item.id).to eq(1)
    end

    it 'has a name' do
      expect(@item.name).to eq('Pencil')
    end

    it 'has a description' do
      expect(@item.description).to eq('You can use it to write things')
    end

    it 'has a unit_price' do
      expect(@item.unit_price).to eq(BigDecimal(10.99, 4) / 100)
    end

    it 'has a merchant_id' do
      expect(@item.merchant_id).to eq(2)
    end

    it '#update_name' do
      @item.update_name('Pen')
      expect(@item.name).to eq('Pen')
    end

    it '#update_description' do
      @item.update_description('This is a description')
      expect(@item.description).to eq('This is a description')
    end

    it '#update_unit_price' do
      @item.update_unit_price(BigDecimal(999) / 100)
      expect(@item.unit_price).to eq(0.999e1)
    end

    it '#update_updated_at' do
      @item.update_updated_at
      expect(@item.updated_at).to_not eq(@updated_at)
    end
  end
end
