# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/boards#show'

  scope module: :web do
    resource :board, only: :show
    resource :session, only: %i[new create destroy]
    resource :developers, only: %i[new create]
  end

  namespace :admin do
    resources :users
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
