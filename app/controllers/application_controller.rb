class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :human_date_and_time

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def human_date_and_time(date)
    date.strftime("%b %e, %l:%M %p")
  end
end
