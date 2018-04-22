class Review < ActiveRecord::Base
  belongs_to :projects
  self.table_name = 'reviews'

end
