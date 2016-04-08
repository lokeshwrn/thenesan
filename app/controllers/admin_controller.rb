class AdminController < ApplicationController

  USER, PASSWORD = 'katomaran', 'robotics'

  before_filter :authentication_check, :except => [:index, :new_index, :show_articles]

  def new_articles
    @articles = Article.new
    @page_properties = {:header => "Create New Article"}
  end

  def create_articles
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to list_articles_url
    else
      render 'new_articles'
    end
  end

  def edit_articles
    @articles = Article.find(params[:id])
    @page_properties = {:header => "Edit Article"}
  end

  def update_articles
    @articles = Article.find(params[:article][:id])
    @articles.update_attributes(article_params)
    if @articles.save
      redirect_to list_articles_url
    else
      render 'edit_articles'
    end
  end

  def list_articles
    @articles = Article.all.by_updated
    @page_properties = {:header => "Article Listing"}
  end

  def test_page

  end

  private

  def article_params
    params.require(:article).permit(:id, :title, :description, :content, :status, :alias_url, :img_url, :content_url, :article_type, :status, :sequence_number)
  end

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == USER && password == PASSWORD
    end
  end

end
