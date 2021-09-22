require 'rspec'
require './lib/invoice'
require './lib/invoice_repository'

describe InvoiceRepository do
  before :each do
    @invoices = InvoiceRepository.new('./data/invoices.csv')
  end

  context '#initialize' do
    it 'exists' do
      expect(@invoices).to be_a InvoiceRepository
    end
  end

  describe 'Repository Methods' do
    it 'returns an array of all invoice instances' do
      expect(@invoices.all).to be_an Array
      expect(@invoices.all.first).to be_an_instance_of Invoice
      expect(@invoices.all.first.status).to eq(:pending)
    end

    it '#find_by_id' do
      expect(@invoices.find_by_id(379).merchant_id).to eq(12334434)
      expect(@invoices.find_by_id(12341234)).to eq(nil)
    end

    it '#find_all_by_customer_id' do
      expect(@invoices.find_all_by_customer_id(5)).to be_an Array
      expect(@invoices.find_all_by_customer_id(5).first).to be_an Invoice
      expect(@invoices.find_all_by_customer_id(5).length).to eq(8)
      expect(@invoices.find_all_by_customer_id(12341234)).to eq([])
    end

    it '#find_all_by_merchant_id' do
      expect(@invoices.find_all_by_merchant_id(12334912)).to be_an Array
      expect(@invoices.find_all_by_merchant_id(12334912).first).to be_an Invoice
      expect(@invoices.find_all_by_merchant_id(12334912).length).to eq(15)
      expect(@invoices.find_all_by_merchant_id(12341234)).to eq([])
    end

    it '#find_all_by_status' do
      expect(@invoices.find_all_by_status(:pending)).to be_an Array
      expect(@invoices.find_all_by_status(:pending).first).to be_an Invoice
      expect(@invoices.find_all_by_status(:pending).length).to eq(1473)
      expect(@invoices.find_all_by_status('this is not a status')).to eq([])
    end

    it '#create' do
      attributes = ({
            :id          => 1,
            :customer_id => 7,
            :merchant_id => 8,
            :status      => 'pending',
            :created_at  => Time.now.round(2),
            :updated_at  => Time.now.round(2)
          })

      expect(@invoices.create(attributes).last).to be_an_instance_of Invoice
      expect(@invoices.create(attributes).last.id).to eq(4987)
      expect(@invoices.create(attributes).last.customer_id).to eq(7)
      expect(@invoices.create(attributes).last.status).to eq(:pending)
    end

    it '#update' do
      attributes = ({
            id:          1,
            customer_id: 7,
            merchant_id: 8,
            status:      :shipped,
            created_at:  Time.now,
            updated_at:  Time.now,
      })
      @invoices.update(1, attributes)
      expected = @invoices.find_by_id(1)

      expect(expected.status).to eq(:shipped)
      expect(expected.updated_at).to_not eq attributes[:created_at]
    end

    it '#delete' do
      @invoices.delete(1)

      expect(@invoices.find_by_id(1)).to eq(nil)
    end
  end
end
