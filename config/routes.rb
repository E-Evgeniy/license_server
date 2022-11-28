Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :clients
  resources :product_keys

  resources :actions_with_clients

  root to: 'generals#index'

  get 'find', to: 'clients#find', as: :find
  get 'create_keys', to: 'actions_with_clients#create_keys', as: :create_keys
  get 'added_keys', to: 'added_keys#added_keys', as: :added_keys
  
  get 'detach_client', to: 'product_keys#detach_client', as: :detach_client
end
