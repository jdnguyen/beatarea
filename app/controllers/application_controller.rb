class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      raise "You are not logged in"
    end
  end
end
