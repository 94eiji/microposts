class SessionsController < ApplicationController
  def new
  end
  
  # 入力されたメールアドレスとパスワードがparams[:session]に入っている
  ## params[:session][:email]     メールアドレス
  ## params[:session][:password]  パスワード
  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combnation'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
