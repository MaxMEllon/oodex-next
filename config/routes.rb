# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, only: %i[sign_in sign_out session]

  namespace :api, defaults: { format: :json } do
    post '/users/sign_in', to: 'users#sign_in'
    delete '/users/sign_out', to: 'users#sign_out'
  end

  mount Sidekiq::Web => '/sidekiq' if Rails.env == 'development'

  namespace :admin do
    mount ActionCable.server => '/cable'

    authenticate :user, lambda { |u| u.super? } do
      mount Sidekiq::Web => '/sidekiq'
    end

    root to: 'top#index'
    resources :sessions do
      put '/activate' => 'sessions#activate', as: :activate
      put '/inactivate' => 'sessions#inactivate', as: :inactivate
      resources :missions do
        resource :problems
      end
    end
  end
end
