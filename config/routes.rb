Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cards, only: [:index, :show, :destroy]
  get '/how_to', to: 'pages#how_to'
end
