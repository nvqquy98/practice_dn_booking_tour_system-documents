class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :tag_type, polymorphic: true, index:true

      t.timestamps
    end
  end
end
