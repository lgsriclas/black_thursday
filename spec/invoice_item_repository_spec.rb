require './lib/invoice_item'
require './lib/invoice_item_repository'
require 'bigdecimal'

RSpec.describe 'invoice_item_repository' do
  before :each do
    @invoice_items = InvoiceItemRepository.new('./data/invoice_items.csv')
  end

  context '#initialize' do
    it 'is an instance of InvoiceItemRepository' do
      expect(@invoice_items).to be_an_instance_of InvoiceItemRepository
    end
  end

  context 'Methods' do
    it '#all' do
      expect(@invoice_items.all).to be_an Array
      expect(@invoice_items.all.length).to eq(21830)
    end

    it '#find_by_id' do
      expect(@invoice_items.find_by_id(1)).to be_an_instance_of(InvoiceItem)
      expect(@invoice_items.find_by_id(1).id).to eq(1)
      expect(@invoice_items.find_by_id(21831)).to eq(nil)
    end

    it '#find_all_by_item_id' do
      expect(@invoice_items.find_all_by_item_id(263519844)).to be_an(Array)
      expect(@invoice_items.find_all_by_item_id(263519844)[0].id).to eq(1)
      expect(@invoice_items.find_all_by_item_id(300000000)).to eq([])
    end

    it '#find all by invoice id' do
      expect(@invoice_items.find_all_by_invoice_id(2)).to be_an(Array)
      expect(@invoice_items.find_all_by_invoice_id(2)[0].id).to eq(9)
      expect(@invoice_items.find_all_by_invoice_id(300000000)).to eq([])
    end

    it '#create' do
      attributes = {
        id:           6,
        item_id:      7,
        invoice_id:   8,
        quantity:     1,
        unit_price:   1099,
        created_at:   Time.now.to_s,
        updated_at:   Time.now.to_s
      }
      expected = @invoice_items.create(attributes)

      expect(expected).to be_an Array
      expect(expected.last.item_id).to eq 7
      expect(expected.last.id).to eq 21831
    end

    it '#update' do
      attributes = {
        id:           6,
        item_id:      7,
        invoice_id:   8,
        quantity:     1,
        unit_price:   1099,
        created_at:   Time.now,
        updated_at:   Time.now
      }
      @invoice_items.update(1, attributes)

      expect(@invoice_items.find_by_id(1).quantity).to eq(1)
      expect(@invoice_items.find_by_id(1).unit_price).to eq(1099)
    end

    it '#delete' do
      @invoice_items.delete('1')
      
      expect(@invoice_items.find_by_id('1')).to eq(nil)
    end
  end
end
