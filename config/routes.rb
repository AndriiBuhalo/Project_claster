Rails.application.routes.draw do
  get 'about/index'
  get 'microposts/yourvote'
  get 'microposts/home'
  resources :microposts do
    member do
      post "vote", to: "microposts#vote"
    end
    resources :comments 
      
  end
  get 'secrets/index'
  devise_for :users
  root to: 'microposts#home'
  resources :users
  resources :home
end
