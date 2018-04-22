class ApplicationController < ActionController::Base
  
  include UserAgent

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user! , :detect_device_variant
  private
  def detect_device_variant
    request.variant = :smart if is_mobile?
  end


  before_filter do
    @breadcrumbs = []
  end
  


end
