Rails.application.routes.draw do
  resources :tasks, except: [:new, :edit]
  mount ActionCable.server => '/cable'

  root to: 'tasks#index'
end
