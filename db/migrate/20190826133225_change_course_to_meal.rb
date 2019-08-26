class ChangeCourseToMeal < ActiveRecord::Migration[5.2]
  def change
    change_column :meals, :course, :string
  end
end
