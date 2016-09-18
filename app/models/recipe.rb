class Recipe < ApplicationRecord
  belongs_to :user
  has_many :meal_recipes
  has_many :meals, through: :meal_recipes
end
