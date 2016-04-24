class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_page_properties

  def set_page_properties
    @page_properties = {:banner_img => "http://res.cloudinary.com/lokeshwrn/image/upload/v1460127634/thenesans/5.png", :banner_content => "Nesans M & A"}
  end

end
