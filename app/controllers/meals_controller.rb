class MealsController < ApplicationController

  def index
    @meals = Meal.all

  end

  def new
    #create a new meal, a meal consists of already existing recipes or new recipes

  end

  def create
    name = params[:name]
    

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end
end
