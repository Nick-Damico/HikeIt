class AddPrivateColumnToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :private, :boolean, :default => false
  end
end
