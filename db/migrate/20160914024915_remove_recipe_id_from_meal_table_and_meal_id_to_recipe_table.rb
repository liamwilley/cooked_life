class RemoveRecipeIdFromMealTableAndMealIdToRecipeTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :recipe_id, :integer
    add_column :recipes, :meal_id, :integer
  end
end
