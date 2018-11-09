Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:edit, :update, :show]
  resources :packages do
    resources :bookings
  end

  patch 'bookings/:id/cancel_booking', to: 'bookings#cancel_booking', as: 'cancel_booking'
end
