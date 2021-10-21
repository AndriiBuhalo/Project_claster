Rails.application.routes.draw do
  root to: 'home#index'
  resources :microposts
  resources :users
  resources :home
  
end
