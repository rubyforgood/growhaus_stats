ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end

def login_with_omniauth
  page.visit root_path
  mock_omniauth_user
  page.click_on("Login with Google")
end

def admin_login
  page.visit root_path
  data = mock_omniauth_user
  page.click_on("Login with Google")
  user = User.find_or_initialize_from_auth(data)
  user.role = "admin"
  user.save!

  user
end

def create_departments
  Department.create!(name: "Distribution")
  Department.create!(name: "Production")
  Department.create!(name: "Education")
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
