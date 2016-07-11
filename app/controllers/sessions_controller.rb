class SessionsController < ApplicationController
  def new
  end
  
  def create
    # user モデルから、params[:session][:email] (name=session なフォームに入力されたemail) を探して @user にいれる
    @user = User.find_by(email: params[:session][:email].downcase)
    # @user が空じゃない場合
    if @user && @user.authenticate(params[:session][:password])
      # session[:user_id] に見つけたユーザの id を代入
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
