class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
  end

  if user.nil?
    flask[:errors] = ["Invalid credentials."]
    render :new

  elsif !user.activated?
    redirect_to root_url, alert: "You must activate your account first! Check your email."
  else
    login_user!(user)
    redirect_to root_url
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end

  def new
    render :new
  end
end
