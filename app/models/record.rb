class Record < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :transaction_date, :month, :day, :year, :content
  serialize :content, JSON
  
  belongs_to :fabric
end