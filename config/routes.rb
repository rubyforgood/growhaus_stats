Rails.application.routes.draw do
  root "home#show"
  resources :forms
  get "/profile", to: "profiles#show"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
