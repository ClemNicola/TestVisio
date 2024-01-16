Rails.application.routes.draw do
  get 'pages/dashboard'
  get 'pages/users'
  get 'pages/advisors'
  # get 'users/advisors'
  devise_for :advisors, controllers: {
    sessions: 'advisors/sessions',
    registrations: 'advisors/registrations'
  }

  namespace :adivsors do
    root :to => "pages#dashboard"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
