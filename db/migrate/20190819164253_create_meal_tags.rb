class CreateMealTags < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_tags do |t|
      t.references :meal, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
