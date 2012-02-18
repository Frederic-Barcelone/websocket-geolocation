class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :device_id
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
    add_index :locations, :device_id
  end
end
