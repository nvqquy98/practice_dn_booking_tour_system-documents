class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.text :title
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tours, %i(user_id created_at)
    #Ex:- add_index("admin_users", "username")
  end
end
