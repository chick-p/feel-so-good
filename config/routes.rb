Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root to: 'sessions#success'
  get '/success', to: 'sessions#success'
end
