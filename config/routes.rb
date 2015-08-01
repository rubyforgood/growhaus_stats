Rails.application.routes.draw do
  root "home#show"
  resources :forms
  get "/profile", to: "profiles#show"
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  match "/logout", to: "sessions#destroy", via: [:get, :delete]
end
