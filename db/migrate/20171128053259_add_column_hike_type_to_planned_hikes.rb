class AddColumnHikeTypeToPlannedHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :planned_hikes, :hike_type, :integer, :default => 0
  end
end
