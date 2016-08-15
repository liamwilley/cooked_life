class RecipesController < ApplicationController

  def new
    recipe = Recipe.new(name: params[:name], user_id: user.id, ingredients: params[:ingredients], prep_time: params[:prep_time], description: params[:description])
    
  end
end
