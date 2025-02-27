Rails.application.routes.draw do
  resources :posts

  resources :posts, except: [:index]

  devise_for :users  , controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
   }

  get 'posts', to:'posts#index', as:'user_root'  
  
  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'
  get '/my_reactions', to: 'reactions#post_with_reactions', as: 'my_reactions'
  
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
   root "home#index"
end
