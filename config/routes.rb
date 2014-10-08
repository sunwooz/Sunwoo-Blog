SunwooBlog::Application.routes.draw do
  root to: 'posts#index'

  devise_for :users

  resources :posts
  resources :book_reviews
end
