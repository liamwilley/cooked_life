class UsersController < ApplicationController

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user_id
      flash[:success] = "Successfully created an account!"
      redirect_to '/'
    else
      flash[:warning] = "Invalid email or password!"
      redirect_to '/signup'
    end
  end

  def index
    render
  end

end
