Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'

  # site-side routes
  get '/products', :to => 'home#products_listing'
  get '/about-us', :to => 'home#about_us'
  get '/products/:product_url', :to => 'home#products'
  get '/products/:product_url/:article_url', :to => 'home#articles'

  # admin-side routes
  get 'admin/articles', :to => 'admin#list_articles', :as => 'list_articles'
  get 'admin/articles/:id/edit', :to => 'admin#edit_articles', :as => 'edit_articles'
  get 'admin/articles/new', :to => 'admin#new_articles', :as => 'new_articles'
  post 'articles' => 'admin#create_articles'
  patch 'articles' => 'admin#update_articles'


  get 'home/readmore'
  get 'home/summary'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
