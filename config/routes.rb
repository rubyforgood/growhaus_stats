Rails.application.routes.draw do
  root "home#show"
  resources :forms
  get "/profile", to: "profiles#show"
  get "/dashboard", to: "dashboard#show"
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get '/auth/failure', to: 'home#show'
  match "/logout", to: "sessions#destroy", via: [:get, :delete]

  resources :users, except: [:new, :update, :edit]
  match "/users", to: "users#update", via: :put
end
