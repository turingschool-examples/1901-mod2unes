Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/songs', to: 'songs#index'

  root 'welcome#index'

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'

  resources :songs, only: [:index, :show]
  # resources :artists, only: [:new, :create, :show]

  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]
end
