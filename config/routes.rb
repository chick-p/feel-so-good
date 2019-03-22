Rails.application.routes.draw do
  get 'scores/index'
  get 'scores/show'
  get 'scores/new'
  get 'scores/edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root to: 'sessions#success'
  get '/success', to: 'sessions#success'
end
