class Fabric < ActiveRecord::Base
  attr_accessible :color, :price, :quantity, :serial, :meters_sold, :rolls_sold, :total_profit

  def self.repeated_serial?(serial_num)
    return !Fabric.where("serial=?", serial_num).blank?
  end
end