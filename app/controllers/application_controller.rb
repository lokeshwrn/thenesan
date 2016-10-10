class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_page_properties

  def set_page_properties
    @page_properties = {:banner_img => "/image/8.jpg", :banner_content => "Nesans Mining and Automation Private Limited", :page_title => "Nesans Mining and Automation Pvt Ltd"}
  end

end
