class Record < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :fabric
end
