Rails.application.routes.draw do
  root "home#index"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:show]

  resource :profile, only: [:show, :edit, :update]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]
end