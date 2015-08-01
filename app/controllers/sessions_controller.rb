class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :login_user

  def create
    @user = User.find_or_initialize_from_auth(request.env['omniauth.auth'])

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'home/show'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
