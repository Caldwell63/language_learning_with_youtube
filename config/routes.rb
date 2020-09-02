Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: [:show]
  resources :cards
  resources :words, only: :index
  root to: 'pages#home'
  get '/how_to', to: 'pages#how_to'
end
