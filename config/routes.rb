Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts do
  namespace :api do
    resources :posts, only: :show, defaults: { format: 'json' }
  end
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update] do
    resources :todos, only: [:create, :destroy] 
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end