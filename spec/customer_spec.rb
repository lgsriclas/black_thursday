require 'rspec'
require './lib/customer'

RSpec.describe Customer do

  before :each do
    @customer = Customer.new({
      :id => 6,
      :first_name => "Joan",
      :last_name => "Clarke",
      :created_at => Time.now.to_s,
      :updated_at => Time.now.to_s
    })
  end

  it 'exists' do
    expect(@customer).to be_an_instance_of Customer
  end

  it 'has attributes' do
    expect(@customer.id).to eq(6)
    expect(@customer.first_name).to eq("Joan")
    expect(@customer.last_name).to eq("Clarke")
    expect(@customer.created_at).to be_an_instance_of Time
    expect(@customer.updated_at).to be_an_instance_of Time
  end

  it '#update_fname' do
    @customer.update_fname('John')
    expect(@customer.first_name).to eq('John')
  end

  it '#update_lname' do
    @customer.update_lname('Travolta')
    expect(@customer.last_name).to eq('Travolta')
  end

  it '#update_updated_at' do
    @customer.update_updated_at
    expect(@customer.updated_at).to_not eq(@updated_at)
  end
end
