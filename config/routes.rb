Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :orders, only: [:new, :create]
  end

  resources :categories, only: [:show] do
    resources :items, only: [:index], module: :categories
  end
      
  root to: "items#index"
end