class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :default_admin
  
  
  private
  def default_admin
   @admin = AdminUser.find_by_email("kishore@rubyeffect.com")
  end
end
