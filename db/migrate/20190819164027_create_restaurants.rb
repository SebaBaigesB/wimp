class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :front_photo
      t.string :description
      t.float :longitude
      t.float :latitude
      t.integer :food_style
      t.string :menu_language
      t.string :photos
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
