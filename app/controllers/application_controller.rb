class ApplicationController < ActionController::Base
  after_filter :set_xhr_flash
  helper :all
  protect_from_forgery

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user
  
  protected
  
    def set_xhr_flash
      flash.discard if request.xhr?
    end  
  
  private
  
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
  
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        flash[:notice] = "You must be logged in."
        redirect_to :login
        return false
      end
    end
end
