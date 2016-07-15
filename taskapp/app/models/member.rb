class Member < ActiveRecord::Base

def change

# カラム追加
add_column :members, :password, :string, :null => false, :after => :name
add_column :members, :items_count, :integer, :null => false, :default => 0, :after => :password

# インデックス作成
add_index :members, :items_count
end
end
