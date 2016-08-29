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
      session[:user_id] = user.id
      flash[:success] = "Successfully created account!"
      redirect_to '/'
    else
      flash[:warning] = "Account Not Created"
      redirect_to '/signup'
    end
  end

  def index
    @users = User.all
  end

  def new
    render 'new.html.erb'
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    user = User.find_by(id: params[:id])
    user.assign_attributes({first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]})
    if user.save
      flash[:success] = "User Updated!"
      redirect_to "/users/#{user.id}"
    else
      flash[:danger] = "User Not Updated!"
      render :edit
    end
  end

  def destroy
    user = User.find_by(id:params[:id])
    user.delete
    flash[:danger] = "User Deleted!"
    redirect_to "/recipes"
  end
end
