Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :customers do
    member do
      get 'cars'
    end
  end
  resources :cars
  resources :coupons

  root "customers#index"
end
