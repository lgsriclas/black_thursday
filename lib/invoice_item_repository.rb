# frozen_string_literal: true

require 'csv'
require_relative 'invoice_item'
require_relative 'csv_readable'

class InvoiceItemRepository
  include CSV_readable

  attr_reader :all

  def initialize(path)
    @all = generate(path)
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def generate(path)
    rows = read_csv(path)

    rows.map do |row|
      InvoiceItem.new(row)
    end
  end

  def find_by_id(id)
    @all.find do |row|
      row.id == id
    end
  end

  def find_all_by_item_id(item_id)
    @all.find_all do |row|
      row.item_id == item_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @all.find_all do |row|
      row.invoice_id == invoice_id
    end
  end

  def create(attributes)
    attributes[:id] = @all.last.id + 1
    attributes[:created_at] = Time.now.to_s
    attributes[:updated_at] = Time.now.to_s

    @all << InvoiceItem.new(attributes)
  end

  def update(id, attributes)
    ii = find_by_id(id)
    ii.update_quantity(attributes[:quantity]) if attributes[:quantity]
    ii.update_unit_price(attributes[:unit_price]) if attributes[:unit_price]
    ii.update_updated_at if ii
    ii
  end

  def delete(id)
    @all.delete(find_by_id(id))
  end
end
