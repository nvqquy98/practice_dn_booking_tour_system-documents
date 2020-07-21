class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.datetime :remmber_at
      t.string :active_digest
      t.boolean :actived
      t.string :reset_password_digest
      t.datetime :reset_password_at
      t.integer :permission, :default => 0

      t.timestamps
    end
  end
end
