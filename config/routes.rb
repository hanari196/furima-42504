Rails.application.routes.draw do
  devise_for :users

   # ログイン済みユーザーのルート
  authenticated :user do
    root to: "items#index", as: :authenticated_root
  end

  # 未ログインユーザーのルート
  unauthenticated do
    root to: "items#index", as: :unauthenticated_root
  end
  
  # 共通の root_path を作る
  root to: "items#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
