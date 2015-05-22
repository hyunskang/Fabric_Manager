class Record < ActiveRecord::Base
  # Should probably remove transaction_date
  attr_accessible :transaction_date, :month, :day, :year, :content
  serialize :content, JSON

  belongs_to :fabric

  def update_record(data_hash)
    record_date = Time.now
    self.month = record_date.month
    self.day = record_date.day
    self.year = record_date.year
    self.content = data_hash
    self.save
  end
end