Rails.application.routes.draw do

  get 'home/index'
  get 'home/evl'

  root 'home#index'


  # site-side routes
  get '/products', :to => 'home#products_listing'
  get '/contact-us', :to => 'home#contact_us'
  get '/about-us', :to => 'home#about_us'
  get '/spares', :to => 'home#spares'
  get '/showroom', :to => 'home#showroom'
  get '/products/:product_url', :to => 'home#products'
  get '/products/:product_url/:article_url', :to => 'home#articles'

  get '/:article_url', :to => 'home#static_page'

  # admin-side routes
  get 'admin/articles', :to => 'admin#list_articles', :as => 'list_articles'
  get 'admin/articles/:id/edit', :to => 'admin#edit_articles', :as => 'edit_articles'
  get 'admin/articles/new', :to => 'admin#new_articles', :as => 'new_articles'
  post 'articles' => 'admin#create_articles'
  patch 'articles' => 'admin#update_articles'

end
