require './lib/invoice_item'
require 'bigdecimal'

RSpec.describe 'InvoiceItem' do
  describe '#initialize' do
    before do
      @ii = InvoiceItem.new({
        id:           6,
        item_id:      7,
        invoice_id:   8,
        quantity:     1,
        unit_price:   BigDecimal(10.99,4),
        created_at:   Time.now.to_s,
        updated_at:   Time.now.to_s
      })
    end

    it 'is an instance of InvoiceItem' do
      expect(@ii).to be_an_instance_of InvoiceItem
    end

    it 'has an id' do
      expect(@ii.id).to eq(6)
    end

    it 'has an item id' do
      expect(@ii.item_id).to eq(7)
    end

    it 'has an invoice id' do
      expect(@ii.invoice_id).to eq(8)
    end

    it 'has a quantity' do
      expect(@ii.quantity).to eq(1)
    end

    it 'has a unit price' do
      expect(@ii.unit_price).to eq(BigDecimal(10.99, 4) / 100)
    end

    it 'has a created at and updated at time' do
      expect(@ii.created_at).to eq(@ii.created_at)
      expect(@ii.updated_at).to eq(@ii.created_at)
    end

    it 'returns the price of invoice items' do
      expect(@ii.unit_price_to_dollars).to be_a(String)
    end

    it '#update_quantity' do
      @ii.update_quantity(100)
      expect(@ii.quantity).to eq(100)
    end

    it '#update_unit_price' do
      @ii.update_unit_price(BigDecimal(999) / 100)
      expect(@ii.unit_price).to eq(0.999e1)
    end

    it '#update_updated_at' do
      @ii.update_updated_at
      expect(@ii.updated_at).to_not eq(@updated_at)
    end
  end
end
