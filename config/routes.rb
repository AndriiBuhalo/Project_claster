Rails.application.routes.draw do
  resources :microposts do
    resources :comments
    member do
      patch "like", to: "microposts#like"
    end
  end

  get 'secrets/index'
  devise_for :users
  root to: 'home#index'
  resources :users
  resources :home
end
