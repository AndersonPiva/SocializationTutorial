Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {registrations: "registrations"}

  match '/usuarios/:id', to: 'users#profile', via: [:get]
  match '/usuarios', to: 'users#allUsers', via:[:get]
  match '/', to: 'users#index', via:[:get]
  match '/usuarios/follow/:id', to: 'users#follow', via:[:get]
  match '/usuarios/unfollow/:id', to: 'users#unfollow', via:[:get]
  match '/usuarios/:id/seguidores', to: 'users#followers', via: [:get]
  match '/usuarios/:id/seguindo', to: 'users#following', via: [:get]
  # You can have the root of your site routed with "root"
  root 'users#index'

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
