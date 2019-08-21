class AddStatusToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :status, :integer
  end
end
