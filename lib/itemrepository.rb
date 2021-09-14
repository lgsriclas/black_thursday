require 'csv'

class ItemRepository

  def initialize(path)
    @path = path
    @rows = CSV.read(@path, headers: true, header_converters: :symbol)
    @all = all
  end

  def all
    result = @rows.map do |row|
      Item.new(row)
    end
  end

  def find_by_id(id)
    result = @all.find do |row|
      row.id == id
    end
    result
  end

  def find_by_name(name)
    result = @all.find do |row|
      row.name == name
    end
    result
  end

  def find_all_with_description(description)
    result = @all.find_all do |row|
      row.description == description
    end
    result
  end

  def find_all_by_price(price)
    result = @all.find_all do |row|
      row.unit_price == price
    end
    result
  end
end