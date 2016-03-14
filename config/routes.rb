Rails.application.routes.draw do
  resources :home, only: [:index]
  resources :tasks, only: [:index]

  mount ActionCable.server => '/cable'

  root to: 'home#index'
end
