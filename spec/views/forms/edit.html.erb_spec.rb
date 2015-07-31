require 'rails_helper'

RSpec.describe "forms/edit", type: :view do
  before(:each) do
    @form = assign(:form, Form.create!(
      :name => "MyString",
      :google_form_url => "MyString",
      :frequency => "MyString",
      :department_id => 1
    ))
  end

  it "renders the edit form form" do
    render

    assert_select "form[action=?][method=?]", form_path(@form), "post" do

      assert_select "input#form_name[name=?]", "form[name]"

      assert_select "input#form_google_form_url[name=?]", "form[google_form_url]"

      assert_select "input#form_frequency[name=?]", "form[frequency]"

      assert_select "input#form_department_id[name=?]", "form[department_id]"
    end
  end
end
