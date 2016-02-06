class StaticPagesController < ApplicationController
  
  # 静的ページ
  ## ホーム画面
  def home
    
    if logged_in?
      # Micropost.new(user_id: current_user.id)
      @micropost = current_user.microposts.build
  
      # フォロー中のユーザのつぶやき一覧を取得する（投稿日の降順）    
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)      
    end
  end
end
