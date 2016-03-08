Rails.application.routes.draw do
  resources :tasks, only: [:index]
  mount ActionCable.server => '/cable'

  root to: 'tasks#index'
end
