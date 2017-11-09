class AddColumnsToHikingTrails < ActiveRecord::Migration[5.1]
  def change
    add_column :hiking_trails, :image_url, :string
    add_column :hiking_trails, :url, :string
  end
end
