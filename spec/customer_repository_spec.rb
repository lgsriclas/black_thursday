require 'rspec'
require './lib/customer'
require './lib/customer_repository'

RSpec.describe CustomerRepository do

  before (:each) do
    @customers = CustomerRepository.new('./data/customers.csv')
  end

  context 'Instantiation' do
    it 'exists' do
      expect(@customers).to be_an_instance_of CustomerRepository
      expect(@customers.all).to be_an Array
      expect(@customers.all[0].id).to eq(1)
      expect(@customers.all[0].first_name).to eq("Joey")
    end
  end

  context 'Repo Methods' do

    it '#find_by_id' do
      expect(@customers.find_by_id(2)).to be_an_instance_of Customer
      expect(@customers.find_by_id(0)).to be nil
    end

    it '#find_all_by_first_name' do
      expect(@customers.find_all_by_first_name('jon')).to be_an Array
      expect(@customers.find_all_by_first_name('geo').count).to eq(5)
    end

    it '#find_all_by_last_name' do
      expect(@customers.find_all_by_last_name('emm').count).to eq(2)
      expect(@customers.find_all_by_last_name('Jeon')).to eq([])
    end

    it '#create' do
      attributes = {
        :id => 6,
        :first_name => "Joan",
        :last_name => "Clarke",
        :created_at => Time.now,
        :updated_at => Time.now
      }

      expect(@customers.create(attributes).first_name).to eq("Joan")
      expect(@customers.create(attributes).last_name).to eq("Clarke")
    end

    it '#update' do
      attributes = {first_name: 'John', last_name: 'Travolta'}
      updated = @customers.update(1, attributes)

      expect(updated.first_name).to eq 'John'
      expect(updated.last_name).to eq 'Travolta'
      expect(updated.id).to eq 1
    end

    it '#delete' do
      deleted = @customers.delete(1)

      expect(deleted.first_name).to eq 'Joey'
      expect(@customers.all).not_to include(deleted)
    end
  end
end
