class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.float :price
      t.string :description
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
