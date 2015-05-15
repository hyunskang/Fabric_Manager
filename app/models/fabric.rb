class Fabric < ActiveRecord::Base
  attr_accessible :color, :price, :quantity, :serial

  def self.repeated_serial?(serial_num)
    return !Fabric.where("serial=?", serial_num).blank?
  end
end