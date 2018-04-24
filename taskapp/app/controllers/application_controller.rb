class ApplicationController < ActionController::Base
  
  include UserAgent

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user! , :detect_device_variant

  before_filter :set_request_filter



  private
  def detect_device_variant
    request.variant = :smart if is_mobile?
  end

  def set_request_filter
    Thread.current[:request] = request
  end


  before_filter do
    @breadcrumbs = []
  end
  


end
