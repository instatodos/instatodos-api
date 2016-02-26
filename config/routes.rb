Rails.application.routes.draw do
  resources :tasks, except: [:new, :edit]
  root to: 'tasks#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
