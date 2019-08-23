Rails.application.routes.draw do
  get '/home' => 'welcome#home'
  root 'welcome#home'

  get 'sessions/new'
  get '/login' => 'sessions#new'
  post 'sessions/create'

  get 'users/new'
  get '/signup' => 'users#new'
  post 'users/create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
