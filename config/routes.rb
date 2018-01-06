Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :rules
  root 'users#index'
  resources :indications
  resources :troubles
  resources :consultations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
