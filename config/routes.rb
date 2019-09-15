Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'

  post 'sessions/create'
end
