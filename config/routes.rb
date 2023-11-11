Rails.application.routes.draw do
  devise_for :users
  root to: "dogs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/:id", to: "dogs#show"
  # Defines the root path route ("/")
  resources :dogs, only: [:index, :show, :new, :create]
  # root "articles#index"
end
