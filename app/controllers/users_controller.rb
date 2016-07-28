class UsersController < ApplicationController
  before_action :set_user, only: [:show, :followings, :followers, :favorites]
  # before_action :check_user, only: [:show]
  def show
    @microposts = @user.microposts.order(created_at: :desc)
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
  
  def followings
    @users = @user.following_users
  end
  
  def followers
    @users = @user.follower_users
  end
  
  def favorites
    @microposts = @user.favorite_microposts
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])  
  end
  
  # def check_user
  #   redirect_to root_url if @user != current_user
  # end
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :region, :password, :password_confirmation)
  end
  
end
