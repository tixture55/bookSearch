class Review < ActiveRecord::Base
  #belong_to :projects
  belongs_to :projects
  self.table_name = 'reviews'

end
