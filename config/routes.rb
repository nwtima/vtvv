Rails.application.routes.draw do

  resource :home, only: 'show'

  root to: 'home#show'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      timeout_in: 30.minutes
  }

  resources :building_profiles
  resource :profile, only: [:edit, :update]
  resource :account, only: [:show, :create] do
    post :change
    post :deposit
    post :withdraw
  end

  namespace :borrower do
    resource :dashboard, only: [:show]
    resources :requests, only: [:new, :create, :show, :index]
  end

  namespace :investor do
    resource :dashboard, only: [:show]
    resources :requests, only: [:new, :create, :show, :index]
  end

  namespace :admin do
    resource :dashboard, only: [:show]
  end

  namespace :underwriter do
    resource :dashboard, only: [:show]
  end

  namespace :support do
    resource :dashboard, only: [:show]
  end

  get '*unmatched_route', to: 'application#not_found' # should be last

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
