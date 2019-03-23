Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :scores

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'scores#index'
end
