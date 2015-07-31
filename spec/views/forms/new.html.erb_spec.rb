require 'rails_helper'

RSpec.describe "forms/new", type: :view do
  before(:each) do
    assign(:form, Form.new(
      :name => "MyString",
      :google_form_url => "MyString",
      :frequency => "MyString",
      :department_id => 1
    ))
  end

  it "renders new form form" do
    render

    assert_select "form[action=?][method=?]", forms_path, "post" do

      assert_select "input#form_name[name=?]", "form[name]"

      assert_select "input#form_google_form_url[name=?]", "form[google_form_url]"

      assert_select "input#form_frequency[name=?]", "form[frequency]"

      assert_select "input#form_department_id[name=?]", "form[department_id]"
    end
  end
end
