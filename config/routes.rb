Rails.application.routes.draw do
  resources :microposts
  get 'secrets/index'
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :home
  
end
