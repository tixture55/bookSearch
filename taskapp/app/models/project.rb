class Project < ActiveRecord::Base
	has_many :tasks
	has_many :reviews
	validates :title,
					presence: { message: "入力してください" },
					length: { minimum: 3, message: "3文字以上必要"}

	def self.search(search) #self.でクラスメソッドとしている
		if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
			Project.where(['name LIKE ?', "%#{search}%"])
		else
			Project.all #全て表示。
		end
	end
end
