require 'rspec'
require './lib/item'
require 'bigdecimal'
require 'time'

describe 'Item' do
  before :each do
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
  
  context '#initialize' do
    it 'exists' do
      expect(@item).to be_an_instance_of Item
    end

    it 'has readable attributes' do
      expect(@item.id).to eq(1)
      expect(@item.name).to eq('Pencil')
      expect(@item.description).to eq('You can use it to write things')
      expect(@item.unit_price).to eq(BigDecimal(10.99, 4) / 100)
      expect(@item.merchant_id).to eq(2)
    end
  end

  context 'Update methods' do
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
