class UserItem < ActiveRecord::Base
  belongs_to :reviews
  self.table_name = 'user_items'
end
