Rails.application.routes.draw do
  
  #get 'sessions/new'

  #TOPページの設定
  root to: 'static_pages#home'
  
  #URLとコントローラー(アクション)とのひも付け
  get   'signup' , to: 'users#new'
  get   'login'  , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    
    # 独自メソッドを追加する
    member do
      get :followings
      get :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
