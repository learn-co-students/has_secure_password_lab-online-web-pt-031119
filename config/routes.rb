Rails.application.routes.draw do
  resources :users
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
