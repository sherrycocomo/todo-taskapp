class AddUserIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_reference :tasks, :user
  end
end
