require 'rspec'
require './lib/item'
require './lib/item_repository'
require 'bigdecimal'

RSpec.describe ItemRepository do
  before :each do
    @items = ItemRepository.new('./data/items.csv')
  end

  context '#initialize' do
    it 'exists' do
      expect(@items).to be_an_instance_of ItemRepository
    end
  end

  context 'Methods' do
    it '#all' do
      expect(@items.all).to be_an Array
      expect(@items.all.first).to be_an Item
    end

    it '#find_by_id' do
      expect(@items.find_by_id(263395617)).to be_an_instance_of Item
      expect(@items.find_by_id(263395617).id).to eq(263395617)
      expect(@items.find_by_id(263395617).name).to eq("Glitter scrabble frames")
      expect(@items.find_by_id(1253467890)).to eq(nil)
    end

    it '#find_by_name' do
      expect(@items.find_by_name("JSK Chai")).to be_an_instance_of Item
      expect(@items.find_by_name("JSK Chai").id).to eq(263549122)
      expect(@items.find_by_name("JSK Chai").name).to eq("JSK Chai")
      expect(@items.find_by_name("This Is Not A Name")).to eq(nil)
    end

    it '#find_all_with_description' do
      example_description = "Free standing wooden letters \n\n15cm\n\nAny colours"
      expected = @items.find_all_with_description(example_description)

      expect(expected).to be_an Array
      expect(expected[0].id).to eq(263396013)
      expect(expected[0].name).to eq("Free standing Woden letters")
      expect(@items.find_all_with_description("fake fake fake")).to eq([])
    end

    it '#find_all_by_price' do
      expect(@items.find_all_by_price(1300)).to be_an Array
      expect(@items.find_all_by_price(BigDecimal(1300) / 100)[0].id).to eq(263395617)
      expect(@items.find_all_by_price(BigDecimal(1300) / 100)[0].name).to eq("Glitter scrabble frames")
      expect(@items.find_all_by_price(981762349871234)).to eq([])
    end

    it '#find_all_by_price_in_range' do
      expect(@items.find_all_by_price_in_range(1000.00..1500.00).length).to eq 19
      expect(@items.find_all_by_price_in_range(1000.00..1500.00)).to be_an Array
      expect(@items.find_all_by_price_in_range(10.00..150.00).length).to eq 910
      expect(@items.find_all_by_price_in_range(10.00..15.00).length).to eq 205
      expect(@items.find_all_by_price_in_range(98176234..1000000000)).to eq([])
    end

    it '#find_all_by_merchant_i' do
      expect(@items.find_all_by_merchant_id(12334261)).to be_an Array
      expect(@items.find_all_by_merchant_id(12334261)[0].id).to eq(263410631)
      expect(@items.find_all_by_merchant_id(12334261)[0].name).to eq("OLIVE SOAP")
      expect(@items.find_all_by_merchant_id(981762349871234)).to eq([])
    end

    it '#create' do
      attributes = {
        :id          => 1,
        :name        => "Pencil",
        :description => "You can use it to write things",
        :unit_price  => 1099,
        :created_at  => Time.now,
        :updated_at  => Time.now,
        :merchant_id => 2
      }

      expect(@items.create(attributes).last.name).to eq("Pencil")
      expect(@items.create(attributes).last.description).to eq("You can use it to write things")
    end

    it '#update' do
      attributes = {
        :id          => 1,
        :name        => "Pencil",
        :description => "You can use it to write things",
        :unit_price  => 1099,
        :created_at  => Time.now,
        :updated_at  => Time.now,
        :merchant_id => 2
      }
      @items.update(263395617, attributes)

      expect(@items.find_by_id(263395617).name).to eq("Pencil")
      expect(@items.find_by_id(263395617).description).to eq("You can use it to write things")
      expect(@items.find_by_id(263395617).unit_price).to eq(1099)
    end

    it '#delete an instance of Item' do
      @items.delete(263395617)
      expect(@items.find_by_id(263395617)).to eq(nil)
    end
  end
end
