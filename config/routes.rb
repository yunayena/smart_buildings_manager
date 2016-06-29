Rails.application.routes.draw do
  resources :sensors do
    resources :measures
    collection do
      get :test_pdf
    end
  end

  resources :boards
  resources :locations
  resources :buildings

  devise_for :users

  get 'set_locale', to: 'application#set_locale'
  root 'application#index'

  mount SmartBuildingsManager::API => '/v1'
end
