class ChangeTasksContentNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :content, false
  end
end
#nullを受け付けない
