require 'rspec'
require './lib/customer'

RSpec.describe Customer do

  before(:each) do
    @c = Customer.new({
      :id => 6,
      :first_name => "Joan",
      :last_name => "Clarke",
      :created_at => Time.now.to_s,
      :updated_at => Time.now.to_s
    })
  end

  it 'exists' do
    expect(@c).to be_an_instance_of Customer
  end

  it 'has attributes' do
    expect(@c.id).to eq(6)
    expect(@c.first_name).to eq("Joan")
    expect(@c.last_name).to eq("Clarke")
    expect(@c.created_at).to be_an_instance_of Time
    expect(@c.updated_at).to be_an_instance_of Time
  end

  it '#update_fname' do
    @c.update_fname('John')
    expect(@c.first_name).to eq('John')
  end

  it '#update_lname' do
    @c.update_lname('Travolta')
    expect(@c.last_name).to eq('Travolta')
  end

  it '#update_updated_at' do
    @c.update_updated_at
    expect(@c.updated_at).to_not eq(@updated_at)
  end
end
