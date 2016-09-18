class Api::V1::MealsController < ApplicationController

  def create
    meal = Meal.new(name: params[:mealName], user_id: params[:currentUserId])
    if meal.save
      render json: meal
    else
      render json: {errors: meal.errors.full_messages}, status: 422
    end
  end

end
