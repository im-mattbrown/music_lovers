Rails.application.routes.draw do

  root to: 'users#index'

  get '/signup' => 'users#new', as: "users"
  post '/signup' => 'users#create'
end
