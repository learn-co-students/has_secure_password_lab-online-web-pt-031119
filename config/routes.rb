Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'application#hello'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
