class CreateFabrics < ActiveRecord::Migration
  def change
    create_table :fabrics do |t|
      t.string :color
      t.string :serial
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
