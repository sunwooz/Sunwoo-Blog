SunwooBlog::Application.routes.draw do
  devise_for :users
  resources :posts
  resources :book_reviews
  root to: 'posts#index'
end
