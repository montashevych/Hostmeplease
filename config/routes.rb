Rails.application.routes.draw do
  resources :places
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup' => 'users#new'

  resources :places
  devise_for :users
  resources :users
end
