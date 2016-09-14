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

  def search
    
    @users = User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}", params[:user_search])

    @recipes = Recipe.where("name LIKE ? OR description LIKE ? OR ingredients LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", params[:user_search])

    if @recipes.empty? && @users.any? # if no recipes and no users return index and flash
      render "recipes/index" #maybe make this go to the home page instead
    elsif Recipe.where("name LIKE ? OR description LIKE ? OR ingredients LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", params[:user_search])
      @recipes
    elsif User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}", params[:user_search])
      @users
      # if @users.any? # maybe you dont need to ask if user again and instead just do the user.where
      #   render "users/index"
      # else
      #   flash[:warning]="Nothing here sir!"
      #   redirect_to '/'
      # end
    # elsif User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}", params[:user_search])
    #   @users
    else
      flash[:warning]="We aint found shit!"
    end
  end



end
