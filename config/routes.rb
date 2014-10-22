Rails.application.routes.draw do

  root "homepage#index", via: :get
  get "signin" => "sessions#new"
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy"


  resources :users do
    post 'follow' => 'following_relationships#create'
    get 'follow' => 'following_relationships#show'
    delete 'follow' => 'following_relationships#destroy'
  end

  resources :following_relationships, only: [:show]
  resources :rants
  resources :dashboard, only: [:index, :show]

end