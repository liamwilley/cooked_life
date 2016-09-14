class AddNameColumnToMealTable < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :name, :string
  end
end
