Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hands/index'
  resources :hands
  root 'hands#index'
end
