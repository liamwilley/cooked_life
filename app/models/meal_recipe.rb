class MealRecipe < ApplicationRecord
  belongs_to :recipe 
  belongs_to :meal 
end
