Rails.application.routes.draw do

  root to: 'rooms#index'

  mount ActionCable.server => '/messenger'

  devise_for :users

  resources :rooms
  resources :messages, only: [ :create ]

end
