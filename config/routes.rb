Rails.application.routes.draw do
  resources :reviews
  resources :add_post_to_feeds
  resources :feeds
  resources :posts
  resources :users, only:[:index, :show, :create, :destroy, :update]
  resources :items, only: [:create]

  # User Routes   
    post "/login", to: "users#login"
    get "/autologin", to: "users#autologin"
  # Feed
  #Posts


  # Reviews 

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
