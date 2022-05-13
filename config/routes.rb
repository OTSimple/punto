Rails.application.routes.draw do

  resources :games, only: :create do
    resources :moves
    member do
      get :play
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/", to: "home#index"

  # Defines the root path route ("/")
  root "home#index"
end
