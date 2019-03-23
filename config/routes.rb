Rails.application.routes.draw do
  resources :scores

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'scores#index'
end
