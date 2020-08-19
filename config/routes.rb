Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/new'
  get 'users/index'
  root to: 'addresses#index'
  resources :addresses
end
