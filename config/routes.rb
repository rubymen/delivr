Rails.application.routes.draw do
  devise_for :users

  resources :orders

  resources :types

  resources :categories

end
