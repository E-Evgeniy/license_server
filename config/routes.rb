Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :clients
  resources :product_keys

  root to: 'generals#index'

  get 'find', to: 'clients#find', as: :find
  get 'added_keys', to: 'actions_with_clients#added_keys', as: :added_keys
  get 'detach_client', to: 'product_keys#detach_client', as: :detach_client
end
