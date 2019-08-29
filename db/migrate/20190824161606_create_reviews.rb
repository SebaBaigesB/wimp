class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.bigint :restaurant_id
      t.bigint :user_id

      t.timestamps
    end
    reversible do |dir|
      dir.up do
        Review.create_translation_table! content: :text
      end
      dir.down do
        Review.drop_translation_table!
      end
    end
  end
end
