Rails.application.routes.draw do
  # get 'pages/dashboard'
  # get 'pages/users'
  get 'pages/advisors'
  get 'pages/show_advisor/:id', to: 'pages#show_advisor', as: 'show_advisor'
  # get 'users/advisors'

  devise_for :advisors, controllers: {
    sessions: 'advisors/sessions',
    registrations: 'advisors/registrations'
  }

  resources :advisors do
    resources :appointment_types
  end


  resources :appointments do
    patch :update_status, on: :member
  end

  resources :advisors do
    resources :appointment_types
    resources :appointments
    resources :availabilities
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
