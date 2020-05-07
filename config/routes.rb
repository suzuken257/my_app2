Rails.application.routes.draw do
  get 'categories/show'
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :category, only: :show
  resources :users, only: :show
end
