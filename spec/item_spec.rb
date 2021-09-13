require 'rspec'
require './lib/item'

describe 'Item' do
  describe '#initialize' do
    before do
      @item = Item.new({
        :id          => 1,
        :name        => "Pencil",
        :description => "You can use it to write things",
        :unit_price  => 0,#BigDecimal.new(10.99,4),
        :created_at  => Time.now,
        :updated_at  => Time.now,
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
      expect(@item.unit_price).to eq(0)
    end
  end
end
