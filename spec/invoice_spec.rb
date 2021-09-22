require 'rspec'
require './lib/invoice'

describe Invoice do
  before :each do
    @invoice = Invoice.new({
          :id          => 6,
          :customer_id => 7,
          :merchant_id => 8,
          :status      => 'pending',
          :created_at  => Time.now.to_s,
          :updated_at  => Time.now.to_s
    })
  end

  context '#initialize' do
    it 'exists' do
      expect(@invoice).to be_an_instance_of Invoice
    end

    it 'has readable attributes' do
      expect(@invoice.id).to eq(6)
      expect(@invoice.customer_id).to eq(7)
      expect(@invoice.merchant_id).to eq(8)
      expect(@invoice.status).to eq(:pending)
      expect(@invoice.created_at).to be_a Time
      expect(@invoice.updated_at).to be_a Time
    end
  end

  context 'update methods' do
    it '#update_status' do
      @invoice.update_status(:shipped)

      expect(@invoice.status).to eq(:shipped)
    end

    it '#update_updated_at' do
      @invoice.update_updated_at

      expect(@invoice.updated_at).to_not eq(@updated_at)
    end
  end
end
