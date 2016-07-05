Rails.application.routes.draw do
  resources :sensors do
    resources :measures
  end

  devise_for :users, path: :session, controllers: { sessions: 'users/sessions' }

  resources :boards
  resources :locations
  resources :buildings
  resources :users

  get 'set_locale', to: 'application#set_locale'
  root 'application#index'

  mount SmartBuildingsManager::API => '/v1'
end
