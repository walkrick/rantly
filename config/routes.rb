Rails.application.routes.draw do

  root "homepage#index", via: :get
  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"
  get "/user/:user_id/rant/:rant_id/favorite" => "favorites#create", as: :favorite
  get "/user/:user_id/rant/:rant_id/unfavorite" => "favorites#destroy", as: :unfavorite



  resources :users do
    post 'follow' => 'following_relationships#create'
    get 'follow' => 'following_relationships#index'
    delete 'follow' => 'following_relationships#destroy'
    resources :favorites, only: [:index]
  end

  resources :rants
  resource :search
  resources :following_relationships, only: [:show]
  resources :dashboard, only: [:index, :show]

end