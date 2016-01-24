class SessionsController < ApplicationController
  def new
  end

  # ログイン  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "#{@user.name}としてログインしました"
      redirect_to @user
    else
      flash[:danger] = 'メールアドレスまたは、パスワードが間違っています'
      render 'new'
    end
  end
  
  # ログアウト
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
