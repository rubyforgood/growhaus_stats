require 'rails_helper'

RSpec.describe "Forms", type: :request do
  describe "GET /forms" do
    it "redirects to login" do
      get forms_path
      expect(response).to redirect_to(root_path)
    end
  end
end
