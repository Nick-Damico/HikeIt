class CreatePlannedHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :planned_hikes do |t|
      t.integer :user_id
      t.integer :hike_id

      t.timestamps
    end
     add_index :planned_hikes, [:hike_id, :user_id]
  end
end
