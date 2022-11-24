Rails.application.routes.draw do
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'users/show'
  # get 'dogs/index'
  # get 'dogs/show'
  # get 'dogs/new'
  # get 'dogs/create'
  # get 'dogs/edit'
  # get 'dogs/update'
  devise_for :users
  root to: 'pages#home'

  resources :dogs do
    resources :bookings, only: %i[new create]
  end
  resources :users, only: %i[show]
  resources :bookings, only: %i[edit update]
end
