Rails.application.routes.draw do
  root 'home#dashbord'

  ## Business Routes for csv
  resources :businesses do
    collection { post :import }
  end
  
  resources :businesses
  get '/fetch_businesses', to: 'businesses#fetch_businesses'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end