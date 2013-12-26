Marcierge::Application.routes.draw do

  #  Admin
  #-----------------------------------------------
  namespace :admin do
    root to: 'admin#index'

    devise_scope :user do
      get :login, to: 'admin#login'
      get :logout, to: 'admin#logout'
    end

    resources :admins, except: :show
    resources :creators, except: :show
    resources :events, except: :show
    resources :information, except: :show
    resources :features, except: :show
  end


  #  Admin for creator
  #-----------------------------------------------
  namespace :admin_creator do
    # l8r
  end


  #  Creators
  #-----------------------------------------------
  resources :creators, only: %w[index show] do
    resources :events, only: %w[index]
  end


  #  Events
  #-----------------------------------------------
  resources :events, only: %w[index show]


  #  Information
  #-----------------------------------------------
  resources :information, only: %w[index show]


  #  Features
  #-----------------------------------------------
  resources :features, only: %w[index show]


  #  Pages
  #-----------------------------------------------
  root to: 'pages#home'

  get :sample, to: 'pages#sample' if Rails.env.development?

end
