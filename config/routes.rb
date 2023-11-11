Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: "pages#home"
  # Defines the root path route ("/")
  resources :dogs, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :show, :index]
    # get "index" , to: "booking#index"
  end


  # root "articles#index"
end
