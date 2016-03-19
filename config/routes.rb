Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :home, only: [:index]
  resources :todos, only: [:show, :create]

  get '/:id', to: 'todos#show'

  root to: 'home#index'
end
