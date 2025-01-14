# frozen_string_literal: true

require 'csv'
require_relative 'transaction'
require_relative 'csv_readable'

class TransactionRepository
  include CSV_readable

  attr_reader :all

  def initialize(path)
    @all = generate(path)
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def generate(path)
    rows = read_csv(path)

    rows.map do |row|
      Transaction.new(row)
    end
  end

  def find_by_id(id)
    @all.find do |transaction|
      id == transaction.id
    end
  end

  def find_all_by_invoice_id(id)
    @all.find_all do |transaction|
      id == transaction.invoice_id
    end
  end

  def find_all_by_credit_card_number(number)
    @all.find_all do |transaction|
      number == transaction.credit_card_number
    end
  end

  def find_all_by_result(result)
    @all.find_all do |transaction|
      result == transaction.result
    end
  end

  def successful_invoice_ids
    find_all_by_result(:success).map do |transaction|
      transaction.invoice_id
    end.uniq!
  end

  def create(attributes)
    attributes[:id] = @all.last.id + 1
    attributes[:created_at] = Time.now.to_s
    attributes[:updated_at] = Time.now.to_s

    @all << Transaction.new(attributes)
  end

  def update(id, attributes)
    txn_to_update = find_by_id(id)
    cc_num        = attributes[:credit_card_number]
    cc_exp        = attributes[:credit_card_expiration_date]
    result        = attributes[:result]

    txn_to_update.update_ccnum(cc_num) if cc_num
    txn_to_update.update_cc_expiration(cc_exp) if cc_exp
    txn_to_update.update_result(result) if result
    txn_to_update.update_updated_at if txn_to_update
    txn_to_update
  end

  def delete(id)
    @all.delete(find_by_id(id))
  end
end
