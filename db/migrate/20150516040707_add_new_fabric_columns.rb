class AddNewFabricColumns < ActiveRecord::Migration
  def change
    add_column :fabrics, :meters_sold, :decimal, null: false, default: 0
    add_column :fabrics, :rolls_sold, :integer, null: false, default: 0
    add_column :fabrics, :total_profit, :decimal, null: false, default: 0 
  end
end
