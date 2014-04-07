Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :notifications, :only => :create
  resources :events, :only => [:index, :show]
  root "home#index"
end
