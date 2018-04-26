class Project < ActiveRecord::Base
	has_many :reviews
	has_many :user_items
	validates :title,
	presence: { message: "入力してください" },
	length: { minimum: 3, message: "3文字以上必要"}

  def hello
    self.title += "でござる"
  end 

  def price_up
    self.price += 1
  end

  def get_item_code
    self.item_code
  end

  def self.search(search) #self.でクラスメソッドとしている
    if search.blank? # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      all
    else
      Project.where(['title LIKE ?', "%#{search}%"])
      #conditions = %w[content name email site_url].map { |c| "comments.#{c} like :search" }
      #where(conditions.join(" or "), :search => "%#{search}%")
    end
  end
end
