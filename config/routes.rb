Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "my_cards", to: "credit_cards#my_cards"

  resources :credit_cards do
    resources :reservations, only: %i[new create]
  end

  resources :reservations, only: %i[show destroy edit update]
end
