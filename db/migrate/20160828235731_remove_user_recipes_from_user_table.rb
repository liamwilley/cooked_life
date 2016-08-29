class RemoveUserRecipesFromUserTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :user_recipes, :id
  end
end
