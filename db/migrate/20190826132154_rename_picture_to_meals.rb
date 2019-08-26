class RenamePictureToMeals < ActiveRecord::Migration[5.2]
  def change
    rename_column :meals, :picture, :photo
  end
end
