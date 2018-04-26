require 'rails_helper'

RSpec.describe Blog, type: :model do

  describe "#hogehoge" do
    context "BlogのFactoryを作成した場合" do
        it "テストデータが作成される" do 
            blog_model = FactoryBot.create(:blog)

            p blog_model
        end
    end
  end

end
