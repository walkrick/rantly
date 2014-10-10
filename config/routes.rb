Rails.application.routes.draw do

  root "homepage#index", via: :get
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout


  resources :users do
    resources :rants

  end

  resources :dashboard, only: [:index, :show]

end