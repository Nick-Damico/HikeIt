class CreateHikingTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :hiking_trails do |t|
      t.string :name
      t.string :location
      t.string :area
      t.float :distance
      t.float :elevation_gain
      t.integer :difficulty_rating

      t.timestamps
    end
  end
end
