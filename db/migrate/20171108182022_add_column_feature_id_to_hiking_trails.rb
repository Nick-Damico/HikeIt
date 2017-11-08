class AddColumnFeatureIdToHikingTrails < ActiveRecord::Migration[5.1]
  def change
    add_column :hiking_trails, :feature_id, :integer
    add_index :hiking_trails, :feature_id
  end
end
