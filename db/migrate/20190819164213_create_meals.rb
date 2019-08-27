class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.float :price
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        Meal.create_translation_table! name: :string, description: :string

      end
      dir.down do
        Meal.drop_translation_table!
      end
    end
  end
end
