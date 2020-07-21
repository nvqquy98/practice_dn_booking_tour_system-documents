class CreateTourDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_details do |t|
      t.references :tour,null: false, foreign_key: true
      t.decimal :sale, precision: 3, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.integer :maximum_people
      t.integer :current_people
      t.datetime :start_at
      t.integer :status

      t.timestamps
    end
   add_index :tour_details, :price
   add_index :tour_details, %i(price sale)
   add_index :tour_details, %i(maximum_people current_people)
   add_index :tour_details, :status
  end
end
