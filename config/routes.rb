Rails.application.routes.draw do
  
  #TOPページの設定
  root to: 'static_pages#home'
  
  #signupが呼ばれたら、UsersControllerのnewへ
  get 'signup', to: 'users#new'

  resources :users
end
