Marcierge::Application.routes.draw do

  #  Admin
  #-----------------------------------------------
  namespace :admin do
    root to: 'admin#index'

    devise_scope :user do
      get :login, to: 'admin#login'
      get :logout, to: 'admin#logout'
    end

    resources :creators
    resources :admins
  end


  #  Admin for creator
  #-----------------------------------------------
  namespace :admin_creator do
    # l8r
  end


  #  Creators
  #-----------------------------------------------
  resources :creators do
    resources :events
  end


  #  Events
  #-----------------------------------------------
  resources :events


  #  Information
  #-----------------------------------------------
  resources :information


  #  Features
  #-----------------------------------------------
  resources :features


  #  Pages
  #-----------------------------------------------
  root to: 'pages#home'

  get :sample, to: 'pages#sample' if Rails.env.development?

end
