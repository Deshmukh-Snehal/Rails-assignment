Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  resources :sports
  get 'get_processed_dataset', to: 'sports#get_processed_dataset'
  resources :sports do
    resources :playerdetails
    resources :posts do
      resources :comments
    end  
    resources :annocements
  end
  resources :comments do
    resources :hashtags, module: :comments
  end
  resources :achievements
  resources :posts do
    resources :hashtags, module: :posts
  end
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end