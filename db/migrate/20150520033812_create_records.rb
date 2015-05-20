class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :fabric, index: true
      t.datetime :transaction_date
      t.string :month, null: false, default: ""
      t.string :day, null: false, default: ""
      t.string :year, null: false, default: ""
      t.text :content, null: false, default: ""
      t.timestamps
    end
  end
end
