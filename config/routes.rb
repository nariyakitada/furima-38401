Rails.application.routes.draw do
  get 'products/new'
  devise_for :users
  get 'items/index'
  root to: "products#index"
  resources :users 
  resources :products, only: [:create, :new]
end
