Rails.application.routes.draw do
  get "home", to: "home#home"
  get "about", to: "about#about"
end
