Rails.application.routes.draw do
  resources :microposts do
    member do
      post "upvote", to: "microposts#upvote"
      patch "downvote", to: "microposts#downvote"
    end
    resources :comments 
      
  end
  
  get 'secrets/index'
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :home
end
