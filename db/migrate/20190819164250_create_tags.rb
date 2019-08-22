class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :title
      t.string :icon
      t.integer :category

      t.timestamps
    end
  end
end
