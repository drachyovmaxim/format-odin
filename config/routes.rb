Whitewalls::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  resources :artists, only: :show
  resources :artworks, only: [:index, :show]
  resources :collections, only: :show
  resources :orders, only: :create

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
