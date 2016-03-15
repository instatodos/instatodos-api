Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :todos, only: [:show, :create]

  mount ActionCable.server => '/cable'

  root to: 'home#index'
end
