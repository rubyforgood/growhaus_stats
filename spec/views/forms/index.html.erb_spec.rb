require 'rails_helper'

RSpec.describe "forms/index", type: :view do
  before(:each) do
    assign(:forms, [
      Form.create!(
        :name => "Name",
        :google_form_url => "Google Form Url",
        :frequency => "Frequency",
        :department_id => 1
      ),
      Form.create!(
        :name => "Name",
        :google_form_url => "Google Form Url",
        :frequency => "Frequency",
        :department_id => 1
      )
    ])
  end

  it "renders a list of forms" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Google Form Url".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
