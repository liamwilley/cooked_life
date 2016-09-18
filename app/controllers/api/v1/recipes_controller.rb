class Api::V1::RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    @recipe = Recipe.new(name: params[:name], description: params[:description], ingredients: params[:ingredients], prep_time: params[:prep_time], instructions: params[:instructions])
    if @recipe.save
      render json: @recipe
    else
      render json: {errors: @recipe.errors.full_messages}, status: 422
    end
  end
end
