class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :user_id
      t.string :recipe_id

      t.timestamps
    end
  end
end
