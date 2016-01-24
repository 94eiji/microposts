module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # ログイン中のユーザはいるか？
  def logged_in?
    !!current_user
  end
  
  # ログインが必要なページにアクセスしたときの対応
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end