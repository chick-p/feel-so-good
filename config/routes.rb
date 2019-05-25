Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      resource :token, only: [:show, :update]
    end
  end
  resources :scores

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  root to: 'scores#index'
end
