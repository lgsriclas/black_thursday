require 'csv'
require './lib/itemrepository'
require './lib/merchant_repository'
require './lib/sales_analyst'

class SalesEngine
  attr_reader :analyst
  def self.from_csv
    @item_path = "./data/items.csv"
    @merchant_path = "./data/merchants.csv"
  end

  def initialize
    @analyst = SalesAnalyst.new#(self)
  end
end
