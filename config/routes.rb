Marcierge::Application.routes.draw do

  #  Admin
  #-----------------------------------------------
  devise_for :admin_users,
    path: '/admin',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    },
    controllers: {
      sessions: 'admin/sessions'
    },
    skip: :registrations

  namespace :admin do
    resources :events, except: :show
    resources :creators, except: :show
    resources :users, except: :show
    resources :admin_users, except: :show
    resources :information, except: :show
    resources :features, except: :show

    root to: 'events#index'
  end


  #  Admin for creator
  #-----------------------------------------------
  namespace :creator_admin do
    # l8r
  end


  #  Creators
  #-----------------------------------------------
  resources :creators, only: %w[index show] do
    resources :events, only: :index
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
