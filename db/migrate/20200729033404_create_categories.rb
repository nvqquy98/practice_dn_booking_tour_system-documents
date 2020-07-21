class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :city
      t.integer :area

      t.timestamps
    end
  end
end
