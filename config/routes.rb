Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :events, :only => [:index, :show]
  root "home#index"
end
