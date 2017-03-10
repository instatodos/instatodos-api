Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :home, only: [:index]
  resources :todo_lists, only: [:show, :create]

  get '/:id', to: 'todo_lists#show'

  get ':id' => 'todo_lists#show'
  root to: 'home#index'
end
