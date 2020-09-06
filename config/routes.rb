Rails.application.routes.draw do
  resources :reviews
  resources :add_post_to_feeds
  resources :feeds
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
