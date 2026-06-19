Rails.application.routes.draw do
  root "home#index"

  # Authentication routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  # User routes
  resources :users, only: [:show, :edit, :update]

  # Dashboard
  get "dashboard", to: "home#dashboard"

  # user quizzes
  resources :quizzes, only: [:index, :show]

  # Admin namespace
  namespace :admin do
    get "dashboard", to: "dashboard#index"
    resources :quizzes do
      resources :questions, except: [:index, :show]
    end
    resources :users, only: [:index] do
      patch "toggle_admin", on: :member
    end
  end
end
