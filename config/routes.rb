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
  get '/users/:id/video' => 'start_matches#video', as: 'user_video'
  get '/users/:id/answers' => 'start_matches#answers', as: 'user_answers'
  get '/users/:id/playlist' => 'start_matches#playlist', as: 'user_playlist'
  get '/users/:id/matches' =>'start_matches#matches', as: 'user_matches'
  get '/users/:id/next_match' => 'start_matches#next_match', as: 'next_match'
  get '/users/:id/profile' => 'start_matches#profile', as: 'user_profile'
  patch '/users/:id' => 'users#update'

  get "*unmatched_route", to: "application#not_found"

end
