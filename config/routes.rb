Coolheadz::Application.routes.draw do

  root :to => 'site#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :profiles
  resources :products
  resources :brands

  devise_for :users do
    resources :orders
      ActiveAdmin.routes(self)
  end


  resources :orders do
    resources :orderproducts
  end

  get 'cart/index'
  get 'cart/show'
  get 'home/index'
  get 'site/index'
  get 'site/about'
  get 'site/contact'
  get 'orderproducts/index'
  get 'orderproducts/new'
  get 'orderproducts/show'
  get 'orderproducts/edit'

  match '/cart' => 'cart#index'
  match '/cart' => 'cart#show'
  match '/cart/:id' => 'cart#add'
  match '/cart/remove/:id' => 'cart#remove'
  match '/clearCart' => 'cart#clearCart'
  match '/checkout' => 'cart#createOrder'
  match '/myprofile' => 'profiles#myprofile'
  match '/about' => 'site#about'
  match '/contact' => 'site#contact'
  match '/search' => 'products#search'




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with 'root'
  # just remember to delete public/index.html.


  # See how all your routes lay out with 'rake routes'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end