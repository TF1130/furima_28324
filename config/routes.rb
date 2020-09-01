Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  get 'addresses/index'
  get 'addresses/new'
  get 'users/index'
  resources :addresses
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end
