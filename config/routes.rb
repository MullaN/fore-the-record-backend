Rails.application.routes.draw do
  resources :rounds, only: [:index]
  resources :matches
  resources :courses, only: [:index]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id/rounds', to: 'users#rounds' 
  get '/rounds/:num', to: 'rounds#num_rounds'
  post '/login', to: 'auth#create'
end
