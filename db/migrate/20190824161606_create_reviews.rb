class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.bigint :restaurant_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
