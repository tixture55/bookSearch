class Project < ActiveRecord::Base
    validates :title,
    presence: { message: "入力してください" },
    length: { minimum: 3, message: "3文字以上必要"}
end
