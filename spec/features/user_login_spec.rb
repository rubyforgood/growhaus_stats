require "rails_helper"
require "webmock/rspec"
OmniAuth.config.test_mode = true

RSpec.describe "Unauthenticated user", type: :feature do
  before :each do
    create_departments
  end

  it "can login" do
    page.visit root_path
    user = mock_omniauth_user
    expect(page).not_to have_content(user.info.name)
    page.click_on("Login with Google")

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end

  it "can logout if logged in" do
    page.visit root_path
    page.click_on("Login with Google")
    within("nav") do
      page.click_on("Logout")
    end

    expect(page).to have_content("Login")
    expect(page.current_path).to eq(root_path)
  end
end

private

def mock_omniauth_user
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    "provider" => "google_oauth2",
    "uid"      => "123456",
    "info" => {
      "name"  => "mock_user",
      "email" => "email@thegrowhaus.org",
      "image" => "mock_user_thumbnail_url"
    },
    "credentials" => {
      "token"  => "mock_token"
    }
  })
end
