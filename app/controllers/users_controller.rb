class UsersController < ApplicationController
  before_filter :authorize_admin

  def index
    @users = User.all.order("id ASC")
  end

  def update
    params["users"].each do |id, values|
      user = User.find(id)
      user.update_attributes!(department_id: values[:department_id], role: values[:role].to_i)
    end
    redirect_to users_path
  end

  private

  def authorize_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end
