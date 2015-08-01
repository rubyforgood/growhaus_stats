class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.find_or_create_from_auth(request.env["omniauth.auth"])
    if user.save
      session[:user_id] = user.id
      redirect_to profile_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
