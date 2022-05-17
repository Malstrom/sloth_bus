Rails.application.routes.draw do
  resources :trips, only: [:index]

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "trips#index"
end
