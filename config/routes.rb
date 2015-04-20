FormatOdin::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'prints#index'
  resources :artists, only: :show
  resources :prints, only: [:show]
  resources :collections, only: :show
  resources :orders, only: :create
  get 'exhibition', to: 'prints#exhibition', as: :exhibition
  get 'kaleidoscope', to: 'home#index', as: :kaleidoscope

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
