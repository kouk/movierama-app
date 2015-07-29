Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  as :user do
      get '/login' => 'devise/sessions#new'
      delete '/logout' => 'devise/sessions#destroy'
  end
  resources :movies
  root to: 'movies#index'
end
