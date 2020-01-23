class AddColumnsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :datetime, null: false
  end
end
