class AddUserAndTaskToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :user, null: false
    add_reference :comments, :task, null: false
  end
end
