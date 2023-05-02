Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 resources :about, only: [:index]
 resources :posts
 
 root 'posts#index'
end

