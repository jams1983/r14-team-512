Rails.application.routes.draw do
  resources :users
  resources :groups
  resources :memberships, only: :destroy
  root to: 'home#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
