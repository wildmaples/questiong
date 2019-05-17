# frozen_string_literal: true

Rails.application.routes.draw do
  root :to => 'home#home'
  get '/', to: 'home#home'
  get 'home', to: 'home#home'
  get 'about', to: 'about#about'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :questions
  resources :answers
  # Post an answer
  get '/question/:question_id/answer', to: 'answers#create'
end
