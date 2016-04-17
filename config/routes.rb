Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'


  # site-side routes
  get '/products', :to => 'home#products_listing'
  get '/about-us', :to => 'home#about_us'
  get '/contact-us', :to => 'home#contact_us'
  get '/nesan-oem', :to => 'home#nesan_oem'
  get '/spares', :to => 'home#spares'
  get '/showroom', :to => 'home#showroom'
  get '/products/:product_url', :to => 'home#products'
  get '/products/:product_url/:article_url', :to => 'home#articles'

  get '/terms-of-use', :to => 'home#terms_of_use'
  get '/privacy-policy', :to => 'home#privacy_policy'
  get '/trademarks', :to => 'home#trademarks'
  get '/site-map', :to => 'home#site_map'


  # admin-side routes
  get 'admin/articles', :to => 'admin#list_articles', :as => 'list_articles'
  get 'admin/articles/:id/edit', :to => 'admin#edit_articles', :as => 'edit_articles'
  get 'admin/articles/new', :to => 'admin#new_articles', :as => 'new_articles'
  post 'articles' => 'admin#create_articles'
  patch 'articles' => 'admin#update_articles'

end
