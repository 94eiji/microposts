class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  # ユーザ詳細
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  # 新規登録
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ようこそ！ Twitterクローンへ"
      redirect_to login_path
    else
      render 'new'
    end
  end
  
  # プロフィール編集
  def edit
  end
  
  # プロフィール更新
  def update
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールを更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  
  # フォームの値を検査する
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area)
  end
  
  # ユーザの情報を設定する
  def set_user
    @user = User.find(params[:id])
  end
end
