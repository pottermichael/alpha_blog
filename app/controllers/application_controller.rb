class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?

  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #true of false boolean if @current user
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
    flash[:danger] = "You Must Be Logged in to Perform that Action"
    redirect_to root_path
    end
  end
  
end
