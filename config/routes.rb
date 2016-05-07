SunwooBlog::Application.routes.draw do
  root to: 'posts#index'

  devise_for :users

  resources :posts
  resources :book_reviews
  resources :subscribers

  get '/about' => 'pages#about', as: :about
  get '/contact' => 'pages#contact', as: :contact
  get '/projects' => 'pages#projects', as: :projects

  #tags
  get '/tags/:tag' => 'posts#index', as: :tag
end
