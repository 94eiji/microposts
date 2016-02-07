class MicropostsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
    
  # 投稿内容の登録
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
      render 'static_pages/home'
    end
  end
  
  # 投稿内容の削除
  def destroy
    
    # 自分の投稿でなければ削除できない
    @micropost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @micropost.nil?
    
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
