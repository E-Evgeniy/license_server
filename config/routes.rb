Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products
  resources :clients
  resources :product_keys

  root to: 'generals#index'

  get 'find', to: 'clients#find', as: :find
  get 'result', to: 'find_clients#result', as: :result
  
end
