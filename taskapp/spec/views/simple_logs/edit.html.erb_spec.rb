require 'rails_helper'

RSpec.describe "simple_logs/edit", type: :view do
  before(:each) do
    @simple_log = assign(:simple_log, SimpleLog.create!(
      :text => "MyString"
    ))
  end

  it "renders the edit simple_log form" do
    render

    assert_select "form[action=?][method=?]", simple_log_path(@simple_log), "post" do

      assert_select "input#simple_log_text[name=?]", "simple_log[text]"
    end
  end
end
