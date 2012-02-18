class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :type
      t.string :uuid
      t.string :imei

      t.timestamps
    end
    add_index :devices, [:type, :user_id]
    add_index :devices, :uuid, :unique => true
  end
end
