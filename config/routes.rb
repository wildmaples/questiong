# frozen_string_literal: true

Rails.application.routes.draw do
  root :to => 'home#home'
  get '/', to: 'home#home'
  get 'home', to: 'home#home'
  get 'about', to: 'about#about'

  resources :questions
  resources :answers
  # Post an answer
  get '/question/:question_id/answer', to: 'answers#create'
end
