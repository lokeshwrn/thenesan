class AdminController < ApplicationController

  USER, PASSWORD = 'katomaran', 'thenesans'

  before_filter :authentication_check

  def new_articles
    @articles = Article.new
    @page_properties[:header] = "Create New Article"
    @validate = %w(title email institution parent_name)
    render :template => 'admin/articles_form'
  end

  def create_articles
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to list_articles_url
    else
      redirect_to :back
    end
  end

  def edit_articles
    @articles = Article.find(params[:id])
    @page_properties[:header] = "Edit Article"
    render :template => 'admin/articles_form'
  end

  def update_articles
    @articles = Article.find(params[:article][:id])
    @articles.update_attributes(article_params)
    if @articles.save
      redirect_to list_articles_url
    else
      redirect_to :back
    end
  end

  def list_articles
    @articles = Article.by_type(["Article", "Static-Page"]).order('product_id')
    @page_properties[:header] = "Article Listing"
  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :description, :content, :status, :alias_url, :img_url, :content_url, :status, :sequence_number, :product_id, :article_type, :banner_text, :banner_url, :page_title, :meta_title, :meta_description, :meta_keywords)
  end

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end

end
