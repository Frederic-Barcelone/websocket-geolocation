class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :guid
      t.string :model
      t.string :imei

      t.timestamps
    end
  end
end
