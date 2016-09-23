class MealRecipesController < ApplicationController

  def create
    meal_recipe = MealRecipe.new(meal_id: params[:meal_id], recipe_id: params[:recipe_id])
    if meal_recipe.save
      render json: meal_recipe
    else
      render json: {errors: meal_recipe.errors.full_messages}, status: 422
    end
  end

  def show
    @meal_recipe = MealRecipe.find_by(meal_id: params[:meal_id])
  end


end
