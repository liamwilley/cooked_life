class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :human_date_and_time

  def current_user
    current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def human_date_and_time(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def search
    
    # search = params[:user_search].split(" ")
    @meals = Meal.where("name ILIKE ?", "%#{params[:user_search]}%")

    @users = User.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR full_name ILIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%")

    @recipes = Recipe.where("name ILIKE ? OR description ILIKE ? OR ingredients ILIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", "%#{params[:user_search]}%")

    render "users/search"
  end

  def user_logged_in?
    if current_user
      #do nothing
    else
      redirect_to '/login'
    end
  end
end
