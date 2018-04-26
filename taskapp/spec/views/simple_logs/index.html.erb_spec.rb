require 'rails_helper'

RSpec.describe "simple_logs/index", type: :view do
  before(:each) do
    assign(:simple_logs, [
      SimpleLog.create!(
        :text => "Text"
      ),
      SimpleLog.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of simple_logs" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
