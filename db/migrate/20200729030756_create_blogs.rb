class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :blogs, %i(user_id created_at)
    #Ex:- add_index("admin_users", "username")
  end
end
