Rails.application.routes.draw do
  resources :microposts do
    member do
      post "vote", to: "microposts#vote"
    end
    resources :comments 
      
  end
  
  get 'secrets/index'
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :home
end
