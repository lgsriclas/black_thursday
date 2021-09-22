require './lib/sales_engine'
require 'bigdecimal'

RSpec.describe SalesEngine do
  before :each do
    data = {
      items:         './data/items.csv',
      merchants:     './data/merchants.csv',
      invoices:      './data/invoices.csv',
      invoice_items: './data/invoice_items.csv',
      transactions:  './data/transactions.csv',
      customers:     './data/customers.csv'
    }
    @engine = SalesEngine.from_csv(data)
  end

  context 'Engine Creation' do
    it 'exists' do
      expect(@engine).to be_an_instance_of(SalesEngine)
    end

    it 'can access repositories' do
      expect(@engine.items.all).to be_an Array
      expect(@engine.items.all.first).to be_an Item
      expect(@engine.merchants.all.first).to be_a Merchant
      expect(@engine.invoices.all.first).to be_an Invoice
      expect(@engine.invoice_items.all.first).to be_an InvoiceItem
      expect(@engine.transactions.all.first).to be_a Transaction
      expect(@engine.customers.all.first).to be_a Customer
    end
  end

  context 'engine#analyst can create a SalesAnalyst' do
    it 'exists' do
      analyst = @engine.analyst
      expect(analyst).to be_a SalesAnalyst
    end
  end
end
