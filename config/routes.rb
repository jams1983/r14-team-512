Rails.application.routes.draw do

  resources :users
  resources :groups do
    resources :movies do
      post :vote
      post :unvote
    end
  end
  resources :memberships, only: :destroy

  root to: 'home#index'

  get 'movie_details/:movie_id' => 'home#movie_details', as: :movie_details
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

end
