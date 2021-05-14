Rails.application.routes.draw do
  # get :items_index
  devise_for :users
  root to: "items#index"
  #  resources :users, only: [:edit, :update]
  resources :items, only: [:new, :create, :index]

end