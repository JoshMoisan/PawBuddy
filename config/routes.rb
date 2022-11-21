Rails.application.routes.draw do
  devise_for :users
  root to: 'dogs#index'

  resources :dogs do
    resources :bookings, only: %i[new create]
  end
  resources :users, only: %i[show]
  resources :bookings, only: %i[edit update]
end
