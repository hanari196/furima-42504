Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :items do
    resources :orders, only: [:create, :index]
  end

  resources :categories, only: [:show] do
    resources :items, only: [:index], module: :categories
  end
end
