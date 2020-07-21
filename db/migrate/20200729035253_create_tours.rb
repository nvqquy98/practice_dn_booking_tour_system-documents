class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.text :title
      t.references :category, null: false, foreign_key: true
      t.integer :rate, :default => 3
      t.decimal :price, precision: 10, scale: 2
      #Ex:- :default =>''

      t.timestamps
    end
    add_index :tours, %i(category_id created_at)
  end
end
