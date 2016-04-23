class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_page_properties

  def set_page_properties
    @page_properties = {}
    @validate = %w(name email company budget start_date)
  end

end
