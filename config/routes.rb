Rails.application.routes.draw do
  root "home#show"
  get "/profile", to: "profiles#show"
  get "/auth/:provider/callback", to: "sessions#create"
end
