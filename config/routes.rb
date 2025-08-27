Rails.application.routes.draw do
  get "comments/index"
  get "recipe_list/index"
  resources :recipes do
    resources :likes, only: [:create, :destroy]
  end
  resources :recipes
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  get "up" => "rails/health#show", as: :rails_health_check
  root "homepage#index"
end
