Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    collection do
      get 'most_viewed'
      get 'search'
      get 'search_tag'
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :show]
  resources :users, only: :show
  resources :categories, only: [:index, :show]
end