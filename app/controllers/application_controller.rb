class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :login_user

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login_user
    unless current_user
      redirect_to root_path
      return
    end
  end
end
