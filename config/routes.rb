Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  get 'addresses/index'
  get 'addresses/new'
  get 'users/index'
end
