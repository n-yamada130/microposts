class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    if !current_user
      redirect_to login_path
    end
  end
  
  def update
    if current_user.update(user_params)
      flash[:success] = "Update Successful"
      redirect_to current_user
    else
      flash[:danger] = "Update Failed"
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :region, :password, :password_confirmation)
  end
  
end
