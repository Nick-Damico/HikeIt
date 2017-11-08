class AddColumnLeaderIdToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :leader_id, :integer
  end
end
