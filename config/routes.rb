Rails.application.routes.draw do

  get 'reportes/consult'
  get 'reportes/show'
  post 'reportes/show'
  #resources :reportes, :collection => {:consult => :get, :show => :post}
  
  resources :feedbacks

  devise_for :users
  resources :news

  resources :info_generals
  
  get "new_reservation/:play_id", to: "ticket_reservations#new", as: "new_reservation"
  
  resources :ticket_reservations

  resources :theaters

  resources :plays

  resources :actors

  resources :tipo_tickets

  resources :destrezas

  resources :funcions

  resources :clasificacions

  resources :generos
  

  get 'home/index'
  get '/cartelera', to: "plays#cartelera", as: "cartelera"
  get '/actorhistory', to: "actors#actorhistory", as: "actorhistory"
  get '/playhistory', to: "plays#playhistory", as: "playhistory"
  get '/ticket_surrender', to: "ticket_reservations#ticket_surrender", as: "ticket_surrender"
  post '/ticket_surrender', to: "ticket_reservations#ticket_surrender_rev", as: "ticket_token"
  get '/ticket_no_found', to: "ticket_reservations#ticket_no_found", as: "ticket_no_found"
  get '/ticket_found/:id', to: "ticket_reservations#ticket_found", as: "ticket_found"
  post '/ticket_found/:id', to: "ticket_reservations#ticket_found", as: "ticket_state"
  get '/ticketcstate/:id', to: "ticket_reservations#ticketcstate", as: "ticketcstate"
  get '/admin/new_user', to: 'home#sign_up_new_user', as: "new_user"
  post '/admin/create_user', to: 'home#create_user', as: "create_user"
  get '/about', to: "home#about", as:"about"
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
