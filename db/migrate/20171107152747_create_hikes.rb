class CreateHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes do |t|
      t.string :title
      t.text :description
      t.datetime :hike_date
      t.datetime :hike_time
      t.text :notes
      t.integer :hiking_trail_id

      t.timestamps
    end
    add_index :hikes, :hiking_trail_id
  end
end
