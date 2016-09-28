class ChangePrepTimeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :prep_time, :string
  end
end
