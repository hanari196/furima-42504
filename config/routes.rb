Rails.application.routes.draw do
  devise_for :users
  resources :items


  #共通のトップページ
  root to: "items#index"

  # ログイン済みユーザーのルート
  #authenticated :user do
    #root to: "items#index", as: :authenticated_root
  #end

  # 未ログインユーザーのルート
  #unauthenticated do
    #root to: "devise/sessions#new", as: :authenticated_root
  #end

  get "up" => "rails/health#show", as: :rails_health_check
end