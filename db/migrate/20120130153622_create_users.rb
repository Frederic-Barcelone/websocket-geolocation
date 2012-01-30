class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :crypt_passwd

      t.timestamps
    end
  end
end
