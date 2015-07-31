require 'rails_helper'

RSpec.describe "forms/show", type: :view do
  before(:each) do
    @form = assign(:form, Form.create!(
      :name => "Name",
      :google_form_url => "Google Form Url",
      :frequency => "Frequency",
      :department_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Google Form Url/)
    expect(rendered).to match(/Frequency/)
    expect(rendered).to match(/1/)
  end
end
