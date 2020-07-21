class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :context
      t.references :review_type, polymorphic: true
      t.integer :user_id, null: false
      t.integer :repply_id

      t.timestamps
    end
  add_index :reviews, :repply_id
  add_index :reviews, [:user_id, :repply_id]
  add_index :reviews, [:user_id, :created_at]
  end
end
