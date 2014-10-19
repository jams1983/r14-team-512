Rails.application.routes.draw do

  root to: 'home#index'

  resources :users

  get 'movie_details/:movie_id' => 'home#movie_details', as: :movie_details
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
