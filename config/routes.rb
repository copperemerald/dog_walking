Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: "dogs#index"
  # Defines the root path route ("/")
  resources :dogs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show, :index] do
    member do
      patch :accept
      patch :decline
    end
  end
end
