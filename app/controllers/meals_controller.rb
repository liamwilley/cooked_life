class MealsController < ApplicationController

  def index
    @meals = Meal.all

  end

  def new
    #create a new meal, a meal consists of already existing recipes or new recipes

  end

  def create
    name = params[:name]
    @available_recipes = Recipe.where("name ILIKE ? OR description ILIKE ? OR ingredients ILIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%", params[:user_search])
    new_recipe = @recipe = 
    #figure out how to incorporate @recipe instead of new_recipe
      if new_recipe
        name = params[:name]
        ingredients = params[:ingredients]
        prep_time = params[:prep_time]
        description = params[:description]
        instructions = params[:instructions]
      new_recipe = Recipe.new(name: name, user_id: current_user.id, ingredients: ingredients, prep_time: prep_time, description: description, instructions: instructions)
        if @recipe.save
          flash[:success] = "You have created a new recipe!"
        else
          flash[:danger] = "Uh Oh! Your recipe did not get created!"
        end
      end


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
