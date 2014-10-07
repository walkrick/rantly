Rails.application.routes.draw do

  root "dashboard#show"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout


  resources :users do
    resources :rants

  end

  resources :dashboard

end