Rails.application.routes.draw do
  resources :passengers, only: [:index]

  resources :trips, only: [:index] do
    resources :passengers
    member do
      get :book
    end
  end


  resources :user do
    resources :passengers, only: [:show] do
      member do
        get :add_extra_luggage
      end
    end
    resources :credit_cards
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #

  # Defines the root path route ("/")
  root "trips#index"
end
