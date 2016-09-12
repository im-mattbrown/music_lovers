Rails.application.routes.draw do
  resources :users

  resources :user_steps
  post '/user_steps/seeking' => 'user_steps#update'



  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy'
  post '/sessions' => 'sessions#create'
  root to: 'users#index'
end
