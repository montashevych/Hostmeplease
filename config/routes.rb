Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :places
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users

  get  '/users/:id/bookings'   , to: 'users#bookings'  , as: :user_bookings
  get  '/places/:id/bookings'  , to: 'places#bookings' 
  get  '/bookings/:id'         , to: 'bookings#show'   , as: :booking
  get  '/bookings/:id/confirm' , to: 'bookings#confirm', as: :booking_confirm
  get  '/bookings/:id/receipt' , to: 'bookings#receipt', as: :booking_receipt
  get  '/bookings/:id/save'    , to: 'bookings#save'   , as: :booking_save
  post '/bookings/:id/cancel'  , to: 'bookings#cancel' , as: :booking_cancel
  post '/places/:place_id/book', to: 'places#book'     , as: :place_book
end
