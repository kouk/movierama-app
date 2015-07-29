Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  as :user do
      get '/login' => 'devise/sessions#new'
      delete '/logout' => 'devise/sessions#destroy'
  end
  root to: 'movies#index'
end
