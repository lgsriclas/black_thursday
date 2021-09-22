require './lib/invoice_item'
require 'bigdecimal'

RSpec.describe 'InvoiceItem' do
  before :each do
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

  context '#initialize' do
    it 'exists' do
      expect(@ii).to be_an_instance_of InvoiceItem
    end

    it 'has readable attributes' do
      expect(@ii.id).to eq(6)
      expect(@ii.item_id).to eq(7)
      expect(@ii.invoice_id).to eq(8)
      expect(@ii.quantity).to eq(1)
      expect(@ii.unit_price).to eq(BigDecimal(10.99, 4) / 100)
      expect(@ii.created_at).to be_an_instance_of Time
      expect(@ii.updated_at).to be_an_instance_of Time
    end
  end

  context 'Methods' do
    it '#unit_price_to_dollars' do
      expect(@ii.unit_price_to_dollars).to eq '$10.99'
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
