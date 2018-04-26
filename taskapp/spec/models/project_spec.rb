require 'rails_helper'

describe Project do 
  describe "hello method" do
    before do
      project = Project.new
      project.title = "scala入門"
      project.price = "2590"
      project.save
      @projects = Project.where("id = ?", 10).first
    end
    context "normal case." do
      it "not null" do
        @projects.hello.should_not be_nil
      end
      it "compare for title value" do
        result_val = @projects.hello
        result_val.should == "scala入門でござる"
        result_val.should eql("scala入門でござる")
      end
  describe "price_up method test" do
    before do
      @projects = Project.where("id = ?", 10).first
    
    end
    context "normal case " do
      it " price up +1"  do
        #@projects.price_up.should == 2591
        expect(@projects.price_up).to eq(2591)
      end
    end
  end
  describe "validate" do
    context "normal case " do
      it 'is invalid without a name' do
        project = Project.new
        project.valid?
        expect(project.errors.messages[:title]).to include('入力してください')
      end
    end
  end  

    end
  end
end

