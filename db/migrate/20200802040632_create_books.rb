class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.references :tour, null: false, foreign_key: true
      t.references :user_contact, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total, precision: 10, scale: 2
      t.integer :status

      t.timestamps
    end
    add_index :books, %i(tour_id status)
  end
end
