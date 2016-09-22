class Api::V1::MealRecipesController < ApplicationController

   def create
    meal_recipe = MealRecipe.new(meal_id: params[:mealId], recipe_id: params[:recipeId])
    if meal_recipe.save
      render json: meal_recipe
    else
      puts "stuff"
      p meal_recipe.errors.full_messages
      render json: {errors: meal_recipe.errors.full_messages}, status: 422
    end
  end

  def destroy
    puts params
    meal_recipe = MealRecipe.where(meal_id: params[:mealId], recipe_id: params[:recipeId])
    meal_recipe.first.destroy! #destroyed muthafucka
    render json: meal_recipe
  end

  
  
end
