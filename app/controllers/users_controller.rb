class UsersController < ApplicationController
  before_filter :authorize_admin

  def index
    @users = User.all.order("id ASC")
  end

  def update
    User.transaction do
      params["users"].each do |id, values|
        user = User.find(id)
        user.assign_attributes(department_id: values[:department_id], role: values[:role].to_i)
        user.save!
        user.at_least_one_admin
      end
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
