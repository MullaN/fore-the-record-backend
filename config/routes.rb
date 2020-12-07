Rails.application.routes.draw do
  resources :rounds, only: [:index]
  resources :matches, only: [:create]
  resources :courses, only: [:index, :show]
  resources :users, only: [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users/:id/rounds', to: 'users#rounds' 
  get '/rounds/:num', to: 'rounds#num_rounds'
  get '/rounds/courses/:cid', to: 'rounds#top_ten_for_course'
  get '/users/:id/friends', to: 'users#friends'
  get '/profile', to: 'users#profile'
  post '/login', to: 'auth#create'
end
