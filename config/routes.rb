Rails.application.routes.draw do
  resources :reviews
  resources :add_post_to_feeds
  resources :feeds
  resources :posts
  resources :users, only:[:index, :show, :create, :destroy, :update]
  resources :items, only: [:create]

  # User Routes   
    post "https://home-barista-api.herokuapp.com/login", to: "users#login"
    get "https://home-barista-api.herokuapp.com/autologin", to: "users#autologin"
    patch "https://home-barista-api.herokuapp.com/ProfilePicture", to: "users#profile_picture"
    post "https://home-barista-api.herokuapp.com/signup", to: "users#create"
  # Feeds
  #Posts


  # Reviews 

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
