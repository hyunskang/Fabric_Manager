class Fabric < ActiveRecord::Base
  attr_accessible :color, :price, :quantity, :serial, :meters_sold, :rolls_sold, :total_profit
  has_many :records

  def self.repeated_serial?(serial_num)
    return !Fabric.where("serial=?", serial_num).blank?
  end

  def add_new_record(data_hash)
    # Get the date and use it to create a new record
    record = Record.new
    record.update_record(data_hash)
  end
end