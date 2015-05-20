class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :fabric, index: true
      t.datetime :transaction_date
      t.integer :month
      t.integer :day
      t.integer :year
      t.text :content, null: false, default: ""
      t.timestamps
    end
  end
end
