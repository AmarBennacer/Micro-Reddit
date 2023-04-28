Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 resources :about, only: [:index]
 resources :posts

 root 'posts#index'
end

