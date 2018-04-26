require 'rails_helper'

RSpec.describe "simple_logs/show", type: :view do
  before(:each) do
    @simple_log = assign(:simple_log, SimpleLog.create!(
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
  end
end
