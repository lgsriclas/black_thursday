# frozen_string_literal: true

require 'csv'
require_relative 'customer'
require_relative 'csv_readable'

class CustomerRepository
  include CSV_readable

  attr_reader :all

  def initialize(path)
    @all  = generate(path)
  end

  def inspect
    "#<#{self.class} #{@customers.size} rows>"
  end

  def generate(path)
    rows = read_csv(path)

    rows.map do |row|
      Customer.new(row)
    end
  end

  def find_by_id(id)
    @all.find do |customer|
      id == customer.id
    end
  end

  def find_all_by_first_name(first_name)
    @all.find_all do |customer|
      (customer.first_name.downcase).include?(first_name.downcase)
    end

  end

  def find_all_by_last_name(last_name)
    @all.find_all do |customer|
      (customer.last_name.downcase).include?(last_name.downcase)
    end
  end

  def create(attributes)
    attributes[:id] = @all.last.id + 1
    attributes[:created_at] = Time.now.to_s
    attributes[:updated_at] = Time.now.to_s

    new_customer = Customer.new(attributes)
    @all << new_customer
    new_customer
  end

  def update(id, attributes)
    customer = find_by_id(id)
    customer.update_fname(attributes[:first_name]) if attributes[:first_name]
    customer.update_lname(attributes[:last_name]) if attributes[:last_name]
    customer.update_updated_at
    customer
  end

  def delete(id)
    @all.delete(find_by_id(id))
  end
end
