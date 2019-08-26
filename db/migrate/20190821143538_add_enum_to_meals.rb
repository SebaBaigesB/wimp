class AddEnumToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :meals, :course, :integer
    add_column :meals, :picture, :string
  end
end
