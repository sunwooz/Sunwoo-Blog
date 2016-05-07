SunwooBlog::Application.routes.draw do
  root to: 'posts#index'

  devise_for :users

  resources :posts
  resources :book_reviews
  resources :subscribers

  get '/about' => 'pages#about'

  #tags
  get '/tags/:tag' => 'posts#index', as: :tag
end
