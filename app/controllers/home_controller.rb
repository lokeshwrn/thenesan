class HomeController < ApplicationController

  include HomeHelper

  def index
    @page_properties.merge!(page_properties_for("index_page"))
  end

  def spares
    @page_properties.merge!(page_properties_for("spares"))
  end

  def showroom
    @page_properties.merge!(page_properties_for("showroom"))
  end

  def about_us
    @page_properties.merge!(page_properties_for("about_us"))
  end

  def contact_us
    @page_properties.merge!(page_properties_for("contact_us"))
    @validate_project = %w(name email company budget start_date)
    @validate_machine = %w(name email company product)
  end

  def products_listing
    @page_properties.merge!(page_properties_for("products_listing"))
    @products = Product.active
  end

  def products
    @page_properties.merge!(page_properties_for("products"))
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

  def form_submit
    new_params={}
    params["data"].each {|x,y| new_params[y["name"]]=y["value"]}
    mandatory_fields = params["validate"]
    allowed_headers = params["fields"]
    allowed_params = new_params.delete_if { |key, value| !(allowed_headers.include? key.to_s) }
    flag = true
    mandatory_fields.each {|x| flag = (flag && allowed_params[x].present?)}
    @form_datum = FormDatum.new
    @form_datum[:field] = allowed_params.to_json if flag
    @form_datum[:value_of] = params[:field]
    if @form_datum.save
      render :text => "Success"
    else
      render :text => "Failed"
    end
  end

  def verify_login
    sleep(2)
    @user=User.active.where("user_name = ? OR email_id = ?", params[:login][:user_name], params[:login][:user_name]).where("password = ?", params[:login][:password]).first
    if @user.present?
      @user.update_column("last_login", Time.now)
      cookies["logged_in"]=true
      if params[:login][:remember_me].present?
        val=Digest::MD5.hexdigest(@user.user_name)
        @user.update_column('unicode_data', val)
        cookies["remember_me"] = {:value => val, :expires => Time.now+3.months}
      end
      render :json => {:status => true, :message => "Success"}
    else
      render :json => {:status => false, :message => "Failed"}
    end
  end

  def verify_register
    user=User.active.where("user_name = ? OR email_id = ?", params[:user][:user_name], params[:user][:user_name])
    if user.present?
      render :json => {:status => false, :message => "User Already Exists"}
    else
      user=User.new(register_params)
      debugger
      if user.save
        render :json => {:status => true, :message => "Registration Successful"}
      else
        render :json => {:status => false, :message => "Registration Failed"}
      end
    end
  end

  def downloads
    @assets=Asset.active
  end

  def get_file
    asset=Asset.find_by_alias_name(params[:alias_name])
    if asset.present?
      if asset.access_code <= params[:access_code].to_i
        send_file "#{Rails.root}/#{asset.location}"
      else
        redirect_to get_access_code_url, :alias_name=>params[:alias_name]
      end
    else
      redirect_to root_url
    end
  end

  def get_access_code
    @page_properties.merge!(page_properties_for("get_access_code"))
    render "home/download_page"
  end

  def validate_key
    sleep(1)
    user = User.find_by_random_key(params[:id].downcase)
    if user.present?
      render :json => {:status => true, :id => user.role.access_code, :file=>params[:file]}
    else
      render :json => {:status => false, :message => "Invalid Key. Please Enter a valid one"}
    end
  end

  private

  def register_params
    params.require(:user).permit(:first_name, :user_name, :email_id, :password, :role)
  end

end