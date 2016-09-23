class MealsController < ApplicationController
before_action :user_logged_in?
  def index
    @meals = Meal.all

  end

  def new
    #create a new meal, a meal consists of already existing recipes or new recipes

  end

  def edit

  end

  def update

  end

  def show
    @meal = Meal.find_by(id: params[:id])
  end

  def destroy

  end
end
