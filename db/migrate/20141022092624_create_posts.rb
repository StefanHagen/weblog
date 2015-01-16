class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :lead
      t.text :body
      t.integer :administrator_id
      t.boolean :published

      t.timestamps
    end
  end
end
