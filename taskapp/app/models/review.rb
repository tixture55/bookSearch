class Review < ActiveRecord::Base
  belongs_to :projects
  self.table_name = 'reviews'

  scope :star, ->(star) {where("star >= ?", star) }
  
end
