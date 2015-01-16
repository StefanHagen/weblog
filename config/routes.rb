Rails.application.routes.draw do
  
  # Administrator namespace, password protected section of website.
  namespace :admin do 
    # Namespace root
    root 'pages#dashboard'

    # Login/Logout Routes
    get "login"  => "sessions#new",     :as => :login
    post "login" => "sessions#create",  :as => :sign_in
    get "logout" => "sessions#destroy", :as => :logout

    # Resources
    resources :posts do
      resources :comments
    end

    resources :projects do
      resources :comments
    end

    resources :tags
    
  end

  # Public part of the website
  root 'posts#index'
  
  resources :posts do 
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  resources :tags

end
