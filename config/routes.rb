Rails.application.routes.draw do
  devise_for :users
  root to: 'chatrooms#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, only: [:index, :create, :show] do 
    resources :messages, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
