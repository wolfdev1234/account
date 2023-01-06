# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'sessions#index'

  require 'sidekiq/web'
  Sidekiq::Web.set :sessions, false
  mount Sidekiq::Web => '/sidekiq'

  mount OkComputer::Engine, at: '/health'

  resources :summaries, :fines, :checkouts, only: [:index]
  resources :holds, only: [:index, :new, :create]
  resources :redis_jobs, only: [:show, :destroy]

  patch '/holds/batch', to: 'holds#batch_update', as: :holds_batch_update
  delete '/holds/batch', to: 'holds#batch_destroy', as: :holds_batch_destroy
  patch '/checkouts/batch', to: 'checkouts#batch_update', as: :renewals_batch_update

  get 'accept-lending-policy', to: 'lending_policy#show', as: :lending_policy_show
  post 'accept-lending-policy', to: 'lending_policy#accept', as: :lending_policy_accept
  get 'accept-lending-policy/thank-you', to: 'lending_policy#thank_you', as: :lending_policy_thank_you
  get 'accept-lending-policy/error', to: 'lending_policy#error', as: :lending_policy_error

  get 'holds/all', to: 'holds#all', as: :holds_all
  get 'holds/result', to: 'holds#result', as: :result
  get 'checkouts/all', to: 'checkouts#all', as: :checkouts_all
  get '/logout', to: 'sessions#destroy', as: :logout

  # error pages
  match '404', to: 'errors#not_found', via: :all
  match '422', to: 'errors#not_found', via: :all
  match '500', to: 'errors#internal_server_error', via: :all

  # catchall for not predefined requests - keep this at the very bottom of the routes file
  match '*catch_unknown_routes', to: 'errors#not_found', via: :all
end
