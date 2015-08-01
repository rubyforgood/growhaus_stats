class UsersController < ApplicationController
  before_filter :authorize_admin

  def index
  end

  private

  def authorize_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
