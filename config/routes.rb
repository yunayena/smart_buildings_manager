Rails.application.routes.draw do
  scope "(:locale)", :locale => /es|en/ do
    resources :sensors do
      resources :measures
    end

    devise_for :users, path: :session, controllers: { sessions: 'users/sessions' }

    resources :boards
    resources :locations
    resources :buildings
    resources :users

    post 'sensor_details', to: 'sensors#details', as: :sensors_details
    get 'set_locale', to: 'application#set_locale'
    root 'application#index'
  end

  mount SmartBuildingsManager::API => '/v1'
end
