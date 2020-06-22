# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'web/boards#show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  scope module: :web do
    resource :board, only: :show
    resource :session, only: %i[new create destroy]
    resource :developers, only: %i[new create]
    resources :password_resets, only: %i[new create edit update]
  end

  namespace :admin do
    resources :users
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end
end
