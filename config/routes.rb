FormatOdin::Application.routes.draw do

  authenticate :admin_user do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  resources :artists, only: :show
  resources :prints, only: [:index, :show]
  resources :collections, only: :show
  resources :orders, only: :create
  get 'exibition', to: 'prints#exibition', as: :exibition

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
