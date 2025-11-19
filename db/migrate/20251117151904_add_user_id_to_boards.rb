class AddUserIdToBoards < ActiveRecord::Migration[7.2]
  def change
    add_reference :boards, :user
  end
end
