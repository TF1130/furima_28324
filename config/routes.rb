Rails.application.routes.draw do
  devise_for :users
  get 'addresses/index'
  get 'addresses/new'
  get 'users/index'
end
