Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :clients
  resources :product_keys

  resources :key_types
  root to: 'generals#index'

  get 'create_keys', to: 'actions_with_clients#create_keys', as: :create_keys
  get 'added_keys', to: 'added_keys#added_keys', as: :added_keys
  get 'client_keys', to: 'client_keys#client_keys', as: :client_keys

  get 'detach_client', to: 'product_keys#detach_client', as: :detach_client

  get 'find_client', to: 'find_clients#find_client', as: :find_client
  get 'result_client', to: 'find_clients#result_client', as: :result_client

  get 'give_key', to: 'give_keys#give_key', as: :give_key
  get 'assign_key', to: 'give_keys#assign_key', as: :assign_key
end
