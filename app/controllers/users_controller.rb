class UsersController < ApplicationController
  #before_filter :authorize, only: [:show, :edit, :update, :destroy]

  #def index
  #  @users = User.all
  #end

  def show
    @user = current_user #User.find(params[:id])
    @relationshps = @user.relationshps.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render json: @user}
      format.xml {render xml: @user}
    end
  end

  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if  @user.save
      sign_in(@user)
      flash[:success] = "Welcome to the Virtual Library!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update_attributes(user_params)
        flash[:success] = 'User was successfully updated.'
        format.json { head :no_content }
        sign_in(@user)
        redirect_to @user
      else
        render 'edit'
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :country, :zipcode, :useremail, :password, :password_confirmation, :aboutme, :interests)
    end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
