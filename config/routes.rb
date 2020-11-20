Rails.application.routes.draw do
  resources :rounds, only: [:index]
  resources :matches
  resources :courses, only: [:index]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
