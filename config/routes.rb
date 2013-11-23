Admin::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :followers, :controllers => { :omniauth_callbacks => "followers/omniauth_callbacks" }

  resources :posts do #, except: :show
   match '(/:yy(/:mm))' => "posts#search", on: :collection, as: :search, via: :get
   resources :post_comments, path: 'comments'
  end
  get 'posts/:yy/:mm/:id' => 'posts#view', as: :post_show
  
  resources :profiles, only: :show, path: 'profile'
  resources :followers, only: :index, path: 'follower'
  
  #get 'posts(/:yy(/:mm))' => 'posts#search', as: :post_search
  
  # get 'posts/:yy/:mm/:id' => 'posts#show', as: :post_show

  # You can have the root of your site routed with "root"
  root to: 'posts#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
       # Directs /admin/products/* to Admin::ProductsController
       # (app/controllers/admin/products_controller.rb)
  #     resources :posts, except: :show
  
  #     get 'posts/:yy/:mm/:id' => 'posts#show', as: :post_show
  #   end
end
