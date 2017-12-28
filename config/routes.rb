Rails.application.routes.draw do
  resources :rules
  root 'troubles#index'
  resources :indications
  resources :troubles
  resources :consultations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
