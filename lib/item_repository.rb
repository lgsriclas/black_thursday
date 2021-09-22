# frozen_string_literal: true

require 'csv'
require_relative 'item'
require_relative 'csv_readable'

class ItemRepository
  include CSV_readable

  attr_reader :all

  def initialize(path)
    @all  = generate(path)
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def generate(path)
    rows = read_csv(path)

    rows.map do |row|
      Item.new(row)
    end
  end

  def find_by_id(id)
    @all.find do |row|
      row.id == id
    end
  end

  def find_by_name(name)
    @all.find do |row|
      row.name == name
    end
  end

  def find_all_with_description(description)
    @all.find_all do |row|
      row.description.downcase == description.downcase
    end
  end

  def find_all_by_price(price)
    @all.find_all do |row|
      row.unit_price == price
    end
  end

  def find_all_by_price_in_range(range)
    @all.find_all do |row|
      range.cover?(row.unit_price)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @all.find_all do |row|
      row.merchant_id == merchant_id
    end
  end

  def create(attributes)
    attributes[:id] = @all.last.id + 1
    attributes[:created_at] = Time.now.to_s
    attributes[:updated_at] = Time.now.to_s
    @all << Item.new(attributes)
  end

  def update(id, attributes)
    item_to_update = find_by_id(id)
    name           = attributes[:name]
    description    = attributes[:description]
    unit_price     = attributes[:unit_price]

    item_to_update.update_name(name) if name
    item_to_update.update_description(description) if description
    item_to_update.update_unit_price(unit_price) if unit_price
    item_to_update.update_updated_at
    item_to_update
  end

  def delete(id)
    @all.delete(find_by_id(id))
  end
end
