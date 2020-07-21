class CreateUserContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_contacts do |t|
      t.string :adress
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_contacts, [:user_id, :phone_number]
  end
end
