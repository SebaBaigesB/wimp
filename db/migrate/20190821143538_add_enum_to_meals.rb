class AddEnumToMeals < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :course, :integer
  end
end
