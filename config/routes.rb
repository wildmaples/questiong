Rails.application.routes.draw do
  get "/", to: "home#home"
  get "home", to: "home#home"
  get "about", to: "about#about"

  resources :questions
end
