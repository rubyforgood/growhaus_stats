require "rails_helper"
require "webmock/rspec"
OmniAuth.config.test_mode = true

RSpec.describe "User dashboard", type: :feature do
  before :each do
    create_departments
  end

  describe "authorization" do
    it "unauthenticated user should not be able to view the user dashboard" do
      page.visit users_path

      expect(page.current_path).to eq(root_path)
    end
    it "authenticated user should not be able to view the user dashboard" do
      login_with_omniauth
      page.visit users_path

      expect(page.current_path).to eq(dashboard_path)
    end

    it "admin should be able to view the user dashboard" do
      user = admin_login
      page.visit users_path

      expect(page.current_path).to eq(users_path)
      expect(page).to have_content(user.name)
    end
  end

  describe "index page" do
    it "admin should be able to see all registered users" do
      user = User.create!(name: "Test user", email: "test@thegrowhaus.org")
      admin = admin_login
      page.visit root_path

      within(".hide-on-med-and-down") do
        page.click_on "Users"
      end

      expect(page).to have_content(admin.name)
      expect(page).to have_content(user.name)
    end
  end
end
