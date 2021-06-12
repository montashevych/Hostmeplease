Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :places
  devise_for :users
  resources :users
  get 'myplaces' => 'places#myplaces'
end
