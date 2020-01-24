class ChangeStatusColumnDefaultTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :status, from: '未着手', to: ''
  end
end
