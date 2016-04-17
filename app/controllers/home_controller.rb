class HomeController < ApplicationController

  def index
    @page_properties = {:carousel => true }
  end

  def readmore

  end

  def about_us

  end
  
  def products_listing
    @products = Product.active
  end

  def products
    @product = Product.active.by_url(params[:product_url])
    @articles = @product.articles.active.by_sequence rescue nil
  end

  def articles
    @article = Article.active.by_url(params[:article_url])
  end
end
