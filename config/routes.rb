Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'user/edit', to: 'users#edit', as:  :edit_user
  get 'packages/map', to: 'packages#index', as:  :packages_map

  resources :users, only: [:update, :show]
  resources :packages do
    resources :bookings
  end

  patch 'bookings/:id/cancel_booking', to: 'bookings#cancel_booking', as: 'cancel_booking'
  patch 'bookings/:id/accept_booking', to: 'bookings#accept_booking', as: 'accept_booking'
  get '/my_dashboard', to: 'dashboard#my_dashboard', as: 'dashboard'
end
