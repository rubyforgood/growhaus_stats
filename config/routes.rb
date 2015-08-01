Rails.application.routes.draw do
  root "home#show"
  resources :forms
  get "/profile", to: "profiles#show"
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  delete "/logout", to: "sessions#destroy"
end
