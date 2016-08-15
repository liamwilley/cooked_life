class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.string :ingredients
      t.integer :prep_time
      t.string :description

      t.timestamps
    end
  end
end
