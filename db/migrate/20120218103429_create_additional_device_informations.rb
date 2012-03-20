class CreateAdditionalDeviceInformations < ActiveRecord::Migration
  def change
    create_table :additional_device_informations do |t|
      t.integer :device_id
      t.string :key
      t.string :value
      t.timestamps
    end

    add_index :additional_device_informations, [:device_id, :key], :unique => true
  end
end
