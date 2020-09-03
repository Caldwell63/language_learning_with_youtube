Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: [:show, :create]
  resources :cards
  resources :words, only: :index
  get '/search', to: 'pages#search'
  root to: 'pages#home'
  get '/how_to', to: 'pages#how_to'
end
