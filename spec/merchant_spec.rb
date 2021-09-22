require'./lib/merchant.rb'

RSpec.describe Merchant do
  before :each do
    @merchant = Merchant.new({ id: 5, name: "Turing School" })
  end

  context '#initialize' do
    it 'exists' do
      expect(@merchant).to be_a Merchant
    end

    it 'has readable attributes' do
      expect(@merchant.name).to eq "Turing School"
      expect(@merchant.id).to eq 5
    end
  end

  context 'update methods' do
    it '#update_name' do
      @merchant.update_name('Target')

      expect(@merchant.name).to eq('Target')
    end
  end
end
