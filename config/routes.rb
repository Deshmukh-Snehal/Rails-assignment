Rails.application.routes.draw do
  resources :playerdetails
  resources :annocements
  resources :comments do
    resources :hashtags, module: :comments
  end
  resources :achievements
  resources :posts do
    resources :hashtags, module: :posts
  end
  resources :sports
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end