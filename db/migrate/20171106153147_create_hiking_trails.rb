class CreateHikingTrails < ActiveRecord::Migration[5.1]
  def change
    create_table :hiking_trails do |t|
      t.string :title
      t.string :location
      t.string :area
      t.text :features
      t.float :distance
      t.float :elevation
      t.float :difficulty

      t.timestamps
    end
  end
end
