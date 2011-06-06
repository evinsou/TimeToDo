class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def error_not_found
    render :template => "error/404.html.erb", :status => 404
  end

  private
    def check_existance
    # db record is?
    end
    def method_missing
    #controller method is?
    end

  protected
    #Set locale from parameters
    def set_locale
      I18n.locale = params[:locale] unless params[:locale].blank?
    end
    #Return the currently logged user in user or nill if there isn't one
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end

    #Make current_user avaible in templates as a helper
    helper_method :current_user

    #Filter method to enforce a login requrement
    #Apply as a before_filter on any controller you want to protect
    def authenticate
      logged_in? ? true : access_denied
    end
  
    #Predicate method to test for a logged in user
    def logged_in?
      current_user.is_a? User
    end
  
    #Make logged_in? avaible in templates as a helper
    helper_method :logged_in?
  
    def access_denied
      redirect_to login_path, :notice => "Please log in to continue"
return false
    end

   
end
