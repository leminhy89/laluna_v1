class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin/admin'
  
  
  before_filter :set_locale
  
  def change_locale_path
      #if current_user
      #  current_user.locale = params[:locale]
      #  current_user.save
      #else
        I18n.locale = params[:locale]
      #end
      
      #redirect_to root_url  
      #redirect_to :back
  end
  
  private
    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
      # current_user.locale
      # request.subdomain
      # request.ENV["HTTP_ACCEPT_LANGUAGE"]
      # request.remote_ip
      # byebug
      # current_uri = request.env['PATH_INFO']
      
      # unless current_uri == "/"+params[:locale]+"/admin/dashboard" 
      #   redirect_to admin_dashboard_index_path
      # end
    end
  
    def default_url_options(options = {})
      {locale: I18n.locale}.merge options
    end
    
    
end
