class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :guid
      t.string :model
      t.string :imei
      t.string :certification_code

      t.timestamps
    end
  end
end
