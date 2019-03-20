Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/songs', to: 'songs#index'

  resources :songs, only: [:index, :show]
  resources :artists, only: [:new, :create, :show]

end
