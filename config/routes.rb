Rails.application.routes.draw do
  devise_for :users

  resources :abilities
  resources :categories
  resources :orders
  resources :permissions
  resources :types
end
