Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  get 'addresses/index'
  get 'addresses/new'
  get 'users/index'
  resources :item_purchases
  resources :addresses
  resources :items do
    resources :orders
  end
end
