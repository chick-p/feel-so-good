Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :scores

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/me', to: 'me#index'
  get '/me/edit', to: 'me#edit'
  put '/me/edit', to: 'me#update'
  get '/me/token', to: 'token#index'
  put '/me/token', to: 'token#update'

  root to: 'scores#index'
end
