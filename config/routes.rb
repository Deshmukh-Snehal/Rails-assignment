Rails.application.routes.draw do
  root 'home#dashbord'

  ## Business Routes for csv
  resources :businesses do
    collection { post :import }
  end
  
  resources :businesses
  get '/fetch_businesses', to: 'businesses#fetch_businesses'

  resources :offers do
    collection do
      get '/generate_offer_json', to: 'offers#generate_offer_json', as: :generate_offer_json
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end