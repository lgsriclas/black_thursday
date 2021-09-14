require 'rspec'
require './lib/item'
require './lib/itemrepository'

describe 'itemrepository' do
  describe '#initialize' do
    it 'is an instance of ItemRepository' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      expect(ir).to be_an_instance_of ItemRepository
    end
  end

  describe '#all' do
    it 'returns an array of all item instances' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      expect(ir.all).to be_an Array
    end
  end

  describe '#find_by_id' do
    it 'returns an instance of Item matching the id' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      expect(ir.find_by_id("263395617")).to be_an_instance_of Item
      expect(ir.find_by_id("263395617").id).to eq("263395617")
      expect(ir.find_by_id("263395617").name).to eq("Glitter scrabble frames")
      expect(ir.find_by_id("1253467890")).to eq(nil)
    end
  end

  describe '#find_by_name' do
    it 'returns an instance of Item matching the name' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      expect(ir.find_by_name("JSK Chai")).to be_an_instance_of Item
      expect(ir.find_by_name("JSK Chai").id).to eq("263549122")
      expect(ir.find_by_name("JSK Chai").name).to eq("JSK Chai")
      expect(ir.find_by_name("This Is Not A Name")).to eq(nil)
    end
  end

  describe '#find_all_with_description' do
    it 'returns all instances of Item matching the description' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      example_description = "Free standing wooden letters \n\n15cm\n\nAny colours"

      expect(ir.find_all_with_description(example_description)).to be_an Array
      expect(ir.find_all_with_description(example_description)[0].id).to eq("263396013")
      expect(ir.find_all_with_description(example_description)[0].name).to eq("Free standing Woden letters")
      expect(ir.find_all_with_description("This Is Not A Description")).to eq([])
    end
  end

  describe '#find_all_by_price' do
    it 'returns all instances of Item matching the price' do
      path = './data/items.csv'
      ir = ItemRepository.new(path)

      expect(ir.find_all_by_price('1300')).to be_an Array
      expect(ir.find_all_by_price('1300')[0].id).to eq("263395617")
      expect(ir.find_all_by_price('1300')[0].name).to eq("Glitter scrabble frames")
      expect(ir.find_all_by_price('981762349871234')).to eq([])
    end
  end
end