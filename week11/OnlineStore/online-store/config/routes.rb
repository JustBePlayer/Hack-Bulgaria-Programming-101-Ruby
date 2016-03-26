Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'

  get 'brands/count', to: 'brands#count'
  get 'brands/new', to: 'brands#new'
  get 'brands/:id', to: 'brands#show'
  get 'brands', to: 'brands#all'
  get 'brands/range/:id', to: 'brands#range'
  get 'brands/range/:id/:count', to: 'brands#range_to_index'
  post 'brands', to: 'brands#create'
  delete 'brands/:id', to: 'brands#delete'
  put 'brands/:id', to: 'brands#update'



  get 'categories/count', to: 'categories#count'
  get 'categories/new', to: 'categories#new'
  get 'categories/:id', to: 'categories#show'
  get 'categories', to: 'categories#list'
  get 'categories/range/:id', to: 'categories#range'
  get 'categories/range/:id/:count', to: 'categories#range_to_index'
  post 'categories', to: 'categories#create'
  delete 'categories/:id', to: 'categories#delete'
  put 'categories/:id', to: 'categories#update'

  get 'products/count', to: 'products#count'
  get 'products/new', to: 'products#new'
  get 'products/:id', to: 'products#show'
  get 'products', to: 'products#list'
  get 'products/range/:id', to: 'products#range'
  get 'products/range/:id/:count', to: 'products#range_to_index'
  post 'products', to: 'products#create'
  delete 'products/:id', to: 'products#delete'
  put 'products/:id', to: 'products#update'

  get 'search/*type/*property/*slug', to: 'search#by_type'
  get 'search/*type/*slug', to: 'search#by_type'

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
