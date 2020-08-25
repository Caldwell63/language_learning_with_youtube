Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/how_to', to: 'pages#how_to'
  resources :cards, only: [:index, :show, :destroy]
end
