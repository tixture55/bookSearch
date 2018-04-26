require 'rails_helper'

RSpec.describe "simple_logs/new", type: :view do
  before(:each) do
    assign(:simple_log, SimpleLog.new(
      :text => "MyString"
    ))
  end

  it "renders new simple_log form" do
    render

    assert_select "form[action=?][method=?]", simple_logs_path, "post" do

      assert_select "input#simple_log_text[name=?]", "simple_log[text]"
    end
  end
end
