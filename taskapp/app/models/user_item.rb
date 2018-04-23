class UserItem < ActiveRecord::Base
  belongs_to :projects
  self.table_name = 'user_items'
end
