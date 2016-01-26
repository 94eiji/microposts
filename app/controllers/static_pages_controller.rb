class StaticPagesController < ApplicationController
  
  # 静的ページ
  ## ホーム画面
  def home
    
    # Micropost.new(user_id: current_user.id)
    @micropost = current_user.microposts.build if logged_in?
  end
end
