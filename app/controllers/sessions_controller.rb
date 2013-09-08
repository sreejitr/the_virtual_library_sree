class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by(useremail: useremail)
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect_to login_url, alert: "Invalid email/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
