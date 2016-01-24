Rails.application.routes.draw do
  
  get 'sessions/new'

  #TOPページの設定
  root to: 'static_pages#home'
  
  #URLとコントローラー(アクション)とのひも付け
  get   'signup' , to: 'users#new'
  get   'login'  , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
