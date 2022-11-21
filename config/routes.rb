Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'dogs#index'

  resources :dogs do
    resources :bookings, only: %i[new create]
  end 
  resources :users, only: %i[show] 
  resources :bookings, only: %i[edit update]
  end
