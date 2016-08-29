class RecipesController < ApplicationController

  def index
    @title = "CookedLife Recipes"
    if params[:user_id]
      @recipes = Recipe.where(user_id: params[:user_id]) 
    else
      @recipes = current_user.recipes
    end
  end

  def new
    # recipe = Recipe.new(name: params[:name], user_id: to_be_current_user, ingredients: params[:ingredients], prep_time: params[:prep_time], description: params[:description])   
  end

  def create   #add params for user id once user authentification is set.
    name = params[:name]
    ingredients = params[:ingredients]
    prep_time = params[:prep_time]
    description = params[:description]
    instructions = params[:instructions]
    @recipe = Recipe.new(name: name, ingredients: ingredients, prep_time: prep_time, description: description, instructions: instructions)
    if @recipe.save
      flash[:success] = "You have created a new recipe!"
      redirect_to "/recipes/#{@recipe.id}"
    else
      flash[:danger] = "Uh Oh! Your recipe did not get created!"
      render :new
    end
  end
  
  def show
    # if params[:id] == "random"
    #   @recipe = Recipe.all.sample
    # else
      @recipe = Recipe.find_by(id: params[:id])
    # end        
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.prep_time = params[:prep_time]
    recipe.description = params[:description]
    recipe.assign_attributes({name: params[:name], ingredients: params[:ingredients], prep_time: params[:prep_time], description: params[:description]})
    if recipe.save
      flash[:success] = "Recipe Updated!"
      redirect_to "/recipes/#{recipe.id}"
    else
      flash[:danger] = "Recipe Not Updated"
      render :edit
    end
  end


  def destroy
    recipe = Recipe.find_by(id: params[:id])
    recipe.delete
    flash[:danger] = "Recipe Deleted!"
    redirect_to "/recipes"
  end


end
