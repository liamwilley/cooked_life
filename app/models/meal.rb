class Meal < ApplicationRecord
  has_many :meal_recipes
  has_many :recipes, through: :meal_recipes
  belongs_to :user

  
end
