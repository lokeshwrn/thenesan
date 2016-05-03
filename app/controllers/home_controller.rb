class HomeController < ApplicationController

  def index
    @page_properties[:carousel] = true
    @page_properties[:page_title] = "Nesans Mining and Automation Pvt Ltd | Stone Crusher Plant, Crusher Machine, Vibrating Screen, Vibratory Feeder, Sand Making Machine"
    @page_properties[:page_name] = "home"
  end

  def spares
    @page_properties[:banner_img] = "/image/1.jpg"
    @page_properties[:banner_content] = "Excellence in Aggregate Equipment Design"
  end

  def showroom
    @page_properties[:banner_img] = "/image/1.jpg"
    @page_properties[:banner_content] = "Excellence in Aggregate Equipment Design"
  end

  def about_us
    @page_properties[:banner_img] = "/image/5.jpg"
    @page_properties[:banner_content] = "To Express To Engineer and To Execute"
  end

  def contact_us
    @page_properties[:banner_img] = "/image/3.jpg"
    @page_properties[:banner_content] = "Get in Touch to get the ball Rolling"
    @page_properties[:disable] = true
    @page_properties[:page_name] = "contact-us"
  end
  
  def products_listing
    @page_properties[:banner_img] = "/image/1.jpg"
    @page_properties[:banner_content] = "Excellence in Aggregate Equipment Design"
    @products = Product.active
  end

  def products
    @page_properties[:banner_img] = "/image/4.jpg"
    # @page_properties[:banner_content] = "Excellence in Aggregate Equipment Design"
    @product = Product.active.by_url(params[:product_url])
    @articles = @product.articles.active.by_sequence rescue nil
  end

  def articles
    @product = Product.by_url(params[:product_url])
    @article = @product.articles.active.by_url(params[:article_url]).first
  end

  def static_page
    @article = Article.active.by_type("Static-Page").by_url(params[:article_url]).first
    if @article
      render :action => 'articles'
    else
      render_404
    end
  end
end
