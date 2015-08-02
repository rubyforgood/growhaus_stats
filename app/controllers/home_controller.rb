class HomeController < ApplicationController
  skip_before_filter :login_user

  def show
    redirect_to dashboard_path if current_user
  end
end
