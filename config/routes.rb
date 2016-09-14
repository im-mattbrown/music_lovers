Rails.application.routes.draw do
  root to: 'users#index'
  resources :user_steps
  post '/user_steps/seeking' => 'user_steps#update'

  get '/signup' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy'
  post '/sessions' => 'sessions#create', as: 'create_session'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  get '/users/:id/video' => 'users#video', as: 'user_video'
  get '/users/:id/answers' => 'users#answers', as: 'user_answers'
  get '/users/:id/playlist' => 'users#playlist', as: 'user_playlist'
  patch '/users/:id' => 'users#update'

end
