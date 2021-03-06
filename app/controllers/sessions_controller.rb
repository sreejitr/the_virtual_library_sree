class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  #  redirect_to home_path
  end

  def create
    #render new
    user = User.find_by(useremail: params[:session][:useremail].downcase)
    if user && user.authenticate(params[:session][:password])
      #session[:user_id] = user.id
      sign_in user
      redirect_to profile_path
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
