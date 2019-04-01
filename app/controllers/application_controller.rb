class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @curernt_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
