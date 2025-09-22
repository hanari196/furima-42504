Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :categorys, only: [] do
    resources :items, only: [:index]
  end
  
  root to: "items#index"
end