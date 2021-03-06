Rails.application.routes.draw do
  

  devise_for :users, controllers: { :sessions => "users/sessions", :registrations => 'users/registrations', 
    :confirmations => 'users/confirmations', :passwords => "users/passwords" }
 
  resources :users
  resources :appointments
  get "/courses/catalogo"=> "courses#catalogo"
  get "/courses/mis_materias"=> "courses#mis_materias"
  resources :courses
  get "/courses/:id/cuestionario/"=>"courses#cuestionario"
  get "/courses/:id/guardar_resultados"=>"courses#guardar_resultados"
  get "/courses/:id/guardar_comentario"=>"courses#guardar_comentario"
  
  resources :sections
  get "/courses/:id/agregar_seccion/"=>"courses#agregar_seccion"
  get "/appointments/:id/confirmar_cita/"=> "appointments#confirmar_cita"
  post "/appointments/generar_reporte/"=> "appointments#generar_reporte"
  resources :schedules
  get 'administracion/index'
  get "consejeria/index"
  root :to => "consejeria#index"
  get "consejeria/" => "consejeria#index"
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
