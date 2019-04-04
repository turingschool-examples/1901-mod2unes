Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :songs, only: [:index, :show]
  # resources :artists, only: [:new, :create, :show]

  resources :users, only: [:new, :create, :show]

  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
  end

  # Namespacing
  namespace :admin do
    resources :categories, only: [:index]
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :carts, only: [:create]
end
