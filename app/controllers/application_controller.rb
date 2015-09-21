class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user?

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    false
    if current_user
      true
    end
  end

end
