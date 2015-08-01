class UsersController < ApplicationController
  before_filter :authorize_admin

  def index
    @users = User.all
  end

  private

  def authorize_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
