Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    collection do
      get 'search'
      get 'search_tag'
      get 'tags_index'
    end
    resources :comments, only: [:create, :destroy]
  end
end