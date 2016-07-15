class Project < ActiveRecord::Base
		has_many :tasks
		validates :title,
    
		presence: { message: "入力してください" },
    length: { minimum: 3, message: "3文字以上必要"}
    
    #validate :add_sample

		def add_sample
			#nameが空のときにエラーメッセージを追加する
			if title.empty?
				errors.add(:name, "に関係するエラーを追加")
				errors[:base] << "add errors concern entire models"
			end
		end
end
