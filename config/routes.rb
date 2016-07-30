Rails.application.routes.draw do

  get 'home/index'

  root 'home#index'

  ## API routes
  get '/api/v1/iot' => 'home#api_data'


  # site-side routes
  get '/content' => 'home#download_page'

  get '/login', :to => 'home#login'
  get '/register', :to => 'home#register'
  post '/verify-login', :to => 'home#verify_login'
  post '/verify-register', :to => 'home#verify_register'

  post '/submit_enquiry', :to => 'home#form_submit'

  get '/products', :to => 'home#products_listing'
  get '/contact-us', :to => 'home#contact_us'
  get '/about-us', :to => 'home#about_us'
  get '/spares', :to => 'home#spares'
  get '/showroom', :to => 'home#showroom'
  get '/downloads' => 'home#downloads'

  # dynamic routes
  get '/products/:product_url', :to => 'home#products'
  get '/products/:product_url/:article_url', :to => 'home#articles'
  get '/:article_url', :to => 'home#static_page'
  get '/validate_key/:id' => 'home#validate_key'
  get '/get_access_code/:alias_name' => 'home#get_access_code', :as => 'get_access_code'
  get '/download/:alias_name(/:access_code)' => 'home#get_file'


  # admin-side routes
  get 'admin/articles', :to => 'admin#list_articles', :as => 'list_articles'
  get 'admin/articles/:id/edit', :to => 'admin#edit_articles', :as => 'edit_articles'
  get 'admin/articles/new', :to => 'admin#new_articles', :as => 'new_articles'
  post 'articles' => 'admin#create_articles'
  patch 'articles' => 'admin#update_articles'

end