Rails.application.routes.draw do
  resources :scores

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  root to: 'scores#index'
end
